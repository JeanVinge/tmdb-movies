//
//  ContainerCellBuilder.swift
//  Utility
//
//  Created by jean.vinge on 20/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxDataSources
import NSObject_Rx

public class RxCollectionCellBuilder<T: AnimatableSectionModelType, C: ContentView>:
NSObject, UICollectionViewDelegateFlowLayout {

    public var dataSource: RxCollectionViewSectionedAnimatedDataSource<T>!
    var cellSize: CGSize

    public init(_ collectionView: UICollectionView, cellSize: CGSize) {
        self.cellSize = cellSize
        super.init()
        let animation = AnimationConfiguration(insertAnimation: .fade,
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

    // MARK: UICollectionViewDelegateFlowLayout

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }

    func calculateSize(_ cell: UICollectionViewCell, at indexPath: IndexPath) -> CGSize {
        return cellSize
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
