//
//  PresentTransition.swift
//  Coordinator
//
//  Created by Jean Vinge on 02/01/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct PresentTransition: TransitionProvider {

    var viewController: UIViewController
    let disposeBag = DisposeBag()
    let animated: Bool

    init(viewController: UIViewController, animated: Bool = true) {
        self.viewController = viewController
        self.animated = animated
    }

    func execute(with router: Router) -> Driver<Void> {
        let subject = PublishSubject<Void>()
        router.rootViewController.present(viewController, animated: animated) {
            subject.onCompleted()
        }
        return subject.take(1).asDriverJustComplete
    }
}
