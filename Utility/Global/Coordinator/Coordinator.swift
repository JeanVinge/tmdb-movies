//
//  Coordinator.swift
//

//
//  Created by Jean Vinge on 21/08/2018.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public protocol Router {
    var rootViewController: UIViewController { get set }
    func coordinate(_ presenter: Presenter) -> Driver<Void>
}

public protocol Coordinator {
    func start(window: UIWindow)
}

extension Coordinator {
    public func rootViewController(in window: UIWindow, with viewController: UIViewController) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

public protocol Presenter {
    func execute(with router: Router) -> Transition
}

struct ScreenRouter: Router {

    // MARK: Var

    var rootViewController: UIViewController

    // MARK: Init

    init(_ rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    @discardableResult
    func coordinate(_ presenter: Presenter) -> Driver<Void> {
        return presenter.execute(with: self).execute(with: self)
    }
}
