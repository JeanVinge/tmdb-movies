//
//  ActivityIndicator.swift
//  Utility
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ActivityIndicator: SharedSequenceConvertibleType {
    typealias Element = LoadingView.State
    typealias SharingStrategy = DriverSharingStrategy

    private let _lock = NSRecursiveLock()
    private var _variable = BehaviorRelay<Element>(value: .loading)
    private let _loading: SharedSequence<SharingStrategy, Element>

    init() {
        _loading = _variable.asDriver()
    }

    fileprivate func trackActivityOfObservable<O: ObservableConvertibleType>(_ source: O) -> Observable<O.Element> {
        return source.asObservable().do(onNext: { _ in
            self.sendStopLoading()
        }, onError: { _ in
            self.onError()
        }, onCompleted: {
            self.sendStopLoading()
        }, onSubscribe: subscribed)
    }

    private func subscribed() {
        _lock.lock()
        _variable.accept(.loading)
        _lock.unlock()
    }

    private func onError() {
        _lock.lock()
        _variable.accept(.error)
        _lock.unlock()
    }

    private func sendStopLoading() {
        _lock.lock()
        _variable.accept(.closed)
        _lock.unlock()
    }

    public func asSharedSequence() -> SharedSequence<SharingStrategy, Element> {
        return _loading
    }
}

extension ObservableConvertibleType {
    func trackActivity(_ activityIndicator: ActivityIndicator) -> Observable<Element> {
        return activityIndicator.trackActivityOfObservable(self)
    }
}
