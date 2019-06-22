//
//  MoviesRouter.swift
//  tmdb-movies
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Domain
import Utility

enum MoviesRouter {
    case openDetail(Movie)
}

extension MoviesRouter: Presenter {
    func execute(with router: Router) -> Transition {
        switch self {
        case .openDetail(let movie):
            return .push(viewController: ViewController(MovieDetailView(MovieDetailViewModel()),
                                                        router: router,
                                                        theme: HomeTheme()))
        }
    }
}
