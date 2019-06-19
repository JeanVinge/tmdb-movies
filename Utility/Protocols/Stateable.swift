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
    var onEnterForeground: Observable<Notification> { get set }
    var onEnterBackground: Observable<Notification> { get set }
    var viewDidLoad: Driver<Void> { get set }
    var viewDidAppear: Driver<Bool> { get set }
    var viewWillAppear: Driver<Bool> { get set }
    var viewWillDisappear: Driver<Bool> { get set }
}

struct StateableViewController: Stateable {
    var onEnterForeground: Observable<Notification>
    var onEnterBackground: Observable<Notification>
    var viewDidLoad: Driver<Void>
    var viewDidAppear: Driver<Bool>
    var viewWillAppear: Driver<Bool>
    var viewWillDisappear: Driver<Bool>

    init(_ viewController: UIViewController) {
        self.onEnterForeground = viewController.rx.onEnterForeground
        self.onEnterBackground = viewController.rx.onEnterBackground
        self.viewDidLoad = viewController.rx.viewDidLoad
        self.viewDidAppear = viewController.rx.viewDidAppear
        self.viewWillAppear = viewController.rx.viewWillAppear
        self.viewWillDisappear = viewController.rx.viewWillDisappear
    }
}
