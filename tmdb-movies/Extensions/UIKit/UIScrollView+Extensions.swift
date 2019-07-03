//
//  UIScrollView+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UIScrollView {
    func correctFinishScroll() {
        if let collectionView = self as? UICollectionView {
            collectionView.performBatchUpdates(nil, completion: { _ in
                collectionView.finishInfiniteScroll()
            })
        } else if let tableView = self as? UITableView {
            tableView.performBatchUpdates(nil, completion: { _ in
                tableView.finishInfiniteScroll()
            })
        } else {
            self.finishInfiniteScroll()
        }
    }
}

extension Reactive where Base: UIScrollView {
    var paginate: Observable<UIScrollView> {
        return Observable.create { [weak base] observable in
            base?.addInfiniteScroll(handler: { scrollView in
                observable.onNext(scrollView)
            })
            return Disposables.create {
                base?.finishInfiniteScroll()
            }
        }
    }

    var shouldEnabledInfiniteScroll: Binder<Bool> {
        return Binder(self.base, binding: { (scrollView, shouldEnable) in
            scrollView.setShouldShowInfiniteScrollHandler({ (_) -> Bool in
                return shouldEnable
            })
        })
    }

    var finishScroll: Binder<Bool> {
        return Binder(self.base, binding: { (scrollView, isRefreshing) in
            if isRefreshing {
                scrollView.correctFinishScroll()
            }
        })
    }
}
