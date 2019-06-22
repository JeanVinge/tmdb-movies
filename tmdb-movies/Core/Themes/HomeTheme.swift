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
        return NavigationTheme(background: .kinoGray,
                               titleColor: .white,
                               tintColor: .white,
                               font: .systemFont(ofSize: 16, weight: .heavy),
                               prefersLargeTitles: true)
    }
    var view: ViewTheme {
        return ViewTheme(backgroundColor: .kinoGray,
                         tintColor: .white,
                         statusBarStyle: .lightContent)
    }
}
