//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Jean Vinge on 19/09/2018.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

import UIKit
import Utility

struct MainCoordinator: Coordinator {

    // MARK: Init

    func start(window: UIWindow) {
        self.rootViewController(in: window, with:
            ViewController(TestView(TestViewModel()), theme: HomeTheme()))
    }
}
