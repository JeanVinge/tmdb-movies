//
//  MovieDetailViewModel.swift
//  tmdb-movies
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility

struct MovieDetailViewModel: ViewModel, Transformable {

    // MARK: Var

    var router: Router?

    struct Input {

    }

    struct Output {

    }

    // MARK: Init

    func transform(input: MovieDetailViewModel.Input) -> MovieDetailViewModel.Output {
        fatalError()
    }
}
