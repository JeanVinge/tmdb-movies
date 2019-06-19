//
//  UIViewController+Extensions.swift
//  Coordinator
//
//  Created by Jean Vinge on 03/01/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    var onEnterForeground: Observable<Notification> {
        return NotificationCenter.default.rx.notification(UIApplication.willEnterForegroundNotification)
    }
    var onEnterBackground: Observable<Notification> {
        return NotificationCenter.default.rx.notification(UIApplication.didEnterBackgroundNotification)
    }
    public var viewDidLoad: Driver<Void> {
        return self.sentMessage(#selector(UIViewController.viewDidLoad)).mapToVoid.asDriverJustComplete
    }
    public var viewDidAppear: Driver<Bool> {
        return self.sentMessage(#selector(UIViewController.viewDidAppear(_:))).map { _ in true }.asDriverJustComplete
    }
    public var viewWillAppear: Driver<Bool> {
        return self.sentMessage(#selector(UIViewController.viewWillAppear(_:))).map { _ in true }.asDriverJustComplete
    }
    public var viewWillDisappear: Driver<Bool> {
        return self.sentMessage(
            #selector(UIViewController.viewWillDisappear(_:)))
            .map { _ in false }.asDriverJustComplete
    }
}
