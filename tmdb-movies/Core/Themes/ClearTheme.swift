//
//  ClearTheme.swift
//  tmdb-movies
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility

public struct ClearTheme: Theme {
    init() {}
    public var navigationBar: NavigationTheme {
        return NavigationTheme(background: .clear,
                               titleColor: .white,
                               tintColor: .white,
                               font: .boldSystemFont(ofSize: 14),
                               prefersLargeTitles: true)
    }
    public var view: ViewTheme {
        return ViewTheme(backgroundColor: .kinoGray,
                         tintColor: .systemBlue,
                         statusBarStyle: .lightContent)
    }
}
