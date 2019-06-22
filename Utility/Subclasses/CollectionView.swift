//
//  CollectionView.swift
//  Utility
//
//  Created by jean.vinge on 20/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

open class CollectionViewFlowLayout: UICollectionViewFlowLayout {

    // MARK: Init

    public override init() {
        super.init()
        configuration()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configuration()
    }

    open func configuration() {
        sectionInset = .zero
        headerReferenceSize = .zero
    }
}

open class CollectionView: UICollectionView, ConfigurableView {

    // MARK: Init

    public convenience init() {
        self.init(frame: .zero,
                   collectionViewLayout: CollectionViewFlowLayout())
        initLayout()
    }

    public convenience init(_ refreshControl: RefreshControl? = nil,
                            flowLayout: UICollectionViewLayout = CollectionViewFlowLayout()) {
        self.init(frame: .zero,
                  collectionViewLayout: flowLayout)
        self.refreshControl = refreshControl
        initLayout()
    }

    public override init(frame: CGRect,
                         collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame,
                   collectionViewLayout: layout)
        initLayout()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLayout()
    }

    open func initSubviews() {
        contentInset = .zero
    }

    open func initConstraints() {}
}
