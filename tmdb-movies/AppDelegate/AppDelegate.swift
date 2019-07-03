//
//  AppDelegate.swift
//  tmdb-movies
//
//  Created by jean.vinge on 11/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import SnapKit
import NSObject_Rx

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Var

    let window = UIWindow(frame: UIScreen.main.bounds)
    lazy var coordinator = MainCoordinator()

    // MARK: Init

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
        -> Bool {
        coordinator.start(window: self.window)
        return true
    }
}
