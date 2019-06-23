//
//  TabBatPushTransition.swift
//  Coordinator
//
//  Created by Jean Vinge on 02/01/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct TabBarPushTransition: TransitionProvider {

    var viewController: UIViewController
    let disposeBag = DisposeBag()

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func execute(with router: Router) -> Driver<Void> {
        let subject = PublishSubject<Void>()
        router.rootViewController.tabBarController?.show(viewController, sender: router.rootViewController)
        router
            .rootViewController
            .navigationController?
            .rx.didShow.mapToVoid
            .bind(to: subject)
            .disposed(by: self.disposeBag)
        return subject.take(1).asDriverJustComplete
    }
}
