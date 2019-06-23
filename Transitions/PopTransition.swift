//
//  PopTransition.swift
//  Coordinator
//
//  Created by Jean Vinge on 02/01/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct PopTransition: TransitionProvider {

    let animated: Bool

    init(animated: Bool = true) {
        self.animated = animated
    }

    func execute(with router: Router) -> Driver<Void> {
        let subject = PublishSubject<Void>()
        router.rootViewController.dismiss(animated: animated) {
            subject.onCompleted()
        }
        return subject.take(1).asDriverJustComplete
    }
}
