//
//  CollectionViewReactive+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 23/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxSwift
import RxCocoa

public extension Reactive where Base: CollectionView {
    var disableRefresh: Binder<Bool> {
        return Binder<Bool>(self.base, binding: { (target, disableRefresh) in
            target.refreshControl = disableRefresh ? target.refresh : nil
        })
    }
}
