//
//  ViewControllerStateble.swift
//  Utility
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxSwift
import RxCocoa

public protocol Stateable {
    var onEnterForeground: Driver<Notification> { get set }
    var onEnterBackground: Driver<Notification> { get set }
    var viewDidLoad: Driver<Void> { get set }
    var viewDidAppear: Driver<Void> { get set }
    var viewWillAppear: Driver<Void> { get set }
    var viewWillDisappear: Driver<Void> { get set }
}

struct StateableViewController: Stateable {
    var onEnterForeground: Driver<Notification>
    var onEnterBackground: Driver<Notification>
    var viewDidLoad: Driver<Void>
    var viewDidAppear: Driver<Void>
    var viewWillAppear: Driver<Void>
    var viewWillDisappear: Driver<Void>

    init(_ viewController: UIViewController) {
        self.onEnterForeground = viewController.rx.onEnterForeground
        self.onEnterBackground = viewController.rx.onEnterBackground
        self.viewDidLoad = viewController.rx.viewDidLoad
        self.viewDidAppear = viewController.rx.viewDidAppear
        self.viewWillAppear = viewController.rx.viewWillAppear
        self.viewWillDisappear = viewController.rx.viewWillDisappear
    }
}
