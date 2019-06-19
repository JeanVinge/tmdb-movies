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
                               titleColor: .clear,
                               tintColor: .black,
                               font: .boldSystemFont(ofSize: 14))
    }
    public var view: ViewTheme {
        return ViewTheme(backgroundColor: .clear,
                         tintColor: .systemBlue,
                         statusBarStyle: .default)
    }
}
