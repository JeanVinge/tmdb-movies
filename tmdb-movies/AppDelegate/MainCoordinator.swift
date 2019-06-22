//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Jean Vinge on 19/09/2018.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

import UIKit
import Utility
import Resources

struct MainCoordinator: Coordinator {

    // MARK: Init

    func start(window: UIWindow) {
        let vc = ViewController(MoviesView(MoviesViewModel()), theme: HomeTheme())
        vc.title = L10n.General.upcomingMovies
        self.rootViewController(in: window, with:
            NavigationController(vc))
    }
}
