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
    var onEnterForeground: Driver<Notification> {
        return NotificationCenter
            .default
            .rx
            .notification(UIApplication.willEnterForegroundNotification)
            .asDriverJustComplete
    }
    var onEnterBackground: Driver<Notification> {
        return NotificationCenter
            .default
            .rx
            .notification(UIApplication.didEnterBackgroundNotification)
            .asDriverJustComplete
    }
    public var viewDidLoad: Driver<Void> {
        return ControlEvent(events:
            methodInvoked(#selector(Base
            .viewDidLoad))
            .mapToVoid)
            .asDriver()
    }
    public var viewDidAppear: Driver<Void> {
        return self
            .sentMessage(#selector(UIViewController.viewDidAppear(_:)))
            .mapToVoid
            .asDriverJustComplete
    }
    public var viewWillAppear: Driver<Void> {
        return self
            .sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid
            .asDriverJustComplete
    }
    public var viewWillDisappear: Driver<Void> {
        return self
            .sentMessage(#selector(UIViewController.viewWillDisappear(_:)))
            .mapToVoid
            .asDriverJustComplete
    }
}
