//
//  Transitor.swift
//  Coordinator
//
//  Created by Jean Vinge on 02/01/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

public enum Transition {
    case push(viewController: UIViewController)
    case present(viewController: UIViewController, animated: Bool)
    case custom(transition: TransitionProvider)
    case dismiss(animated: Bool)
    case pop(animated: Bool)
}

extension Transition: TransitionProvider {
    @discardableResult
    public func execute(with router: Router) -> Driver<Void> {
        switch self {
        case .push(let viewController):
            return PushTransition(viewController: viewController).execute(with: router)
        case .present(let viewController, let animated):
            return PresentTransition(viewController: viewController, animated: animated).execute(with: router)
        case .custom(let transition):
            return transition.execute(with: router)
        case .dismiss(let animated):
            return DismissTransition(animated: animated).execute(with: router)
        case .pop(let animated):
            return PopTransition(animated: animated).execute(with: router)
        }
    }
}

public protocol TransitionProvider {
    func execute(with router: Router) -> Driver<Void>
}
