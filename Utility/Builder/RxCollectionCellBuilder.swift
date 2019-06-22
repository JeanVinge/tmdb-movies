//
//  ContainerCellBuilder.swift
//  Utility
//
//  Created by jean.vinge on 20/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxDataSources
import NSObject_Rx

struct CellSize {
    var size: CGSize?
    var cell: UICollectionViewCell
    var indexPath: IndexPath

    init(_ cell: UICollectionViewCell,
         indexPath: IndexPath) {
        self.cell = cell
        self.indexPath = indexPath
    }
}

public class RxCollectionCellBuilder<T: AnimatableSectionModelType, C: ContentView>:
NSObject, UICollectionViewDelegateFlowLayout {

    public var dataSource: RxCollectionViewSectionedAnimatedDataSource<T>!
    var cellSize: [CellSize] = []

    public init(_ collectionView: UICollectionView) {
        super.init()
        let animation = AnimationConfiguration(insertAnimation: .automatic,
                                               reloadAnimation: .fade,
                                               deleteAnimation: .automatic)
        self.dataSource = RxCollectionViewSectionedAnimatedDataSource<T>
            .init(animationConfiguration: animation, configureCell: { (_, collectionView, indexPath, item)
            -> UICollectionViewCell in
            let cell = collectionView.dequeue(C.self, at: indexPath, with: item)
            return cell
        })
        collectionView.rx.setDelegate(self).disposed(by: rx.disposeBag)
    }

    func populate(indexPath: IndexPath, cell: UICollectionViewCell) {
        if self.cellSize.indices.contains(indexPath.row) {
            cellSize[indexPath.row] = CellSize(cell, indexPath: indexPath)
        } else {
            cellSize.append(CellSize(cell, indexPath: indexPath))
        }
    }

    // MARK: UICollectionViewDelegateFlowLayout

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = dataSource.sectionModels[indexPath.section].items[indexPath.row]
        let cell = collectionView.dequeue(C.self, at: indexPath, with: item)
        self.populate(indexPath: indexPath,
                      cell: cell)
        return calculateSize(cell, at: indexPath)
    }

    func calculateSize(_ cell: UICollectionViewCell, at indexPath: IndexPath) -> CGSize {
        var mSize: CGSize = .zero
        if let filter = cellSize.first(where: { $0.cell == cell }) {
            if let size = filter.size {
                return size
            } else {
                mSize = cell.size(at: indexPath)
            }
        }
        cellSize[indexPath.section].size = mSize
        return mSize
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
