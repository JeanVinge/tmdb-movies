//
//  HomeTheme.swift
//  tmdb-movies
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility

struct HomeTheme: Theme {
    init() {}
    var navigationBar: NavigationTheme {
        return NavigationTheme(background: .white,
                               titleColor: .black,
                               tintColor: .black,
                               font: .boldSystemFont(ofSize: 14))
    }
    var view: ViewTheme {
        return ViewTheme(backgroundColor: .white,
                         tintColor: .white,
                         statusBarStyle: .default)
    }
}
