//
//  MovieDetailViewModel.swift
//  tmdb-movies
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility
import Domain
import RxCocoa
import RxSwift

struct MovieDetailViewModel: ViewModel, Transformable {

    // MARK: Var

    var router: Router?
    var movie: Movie

    struct Input {
        var trigger: Driver<Void>
    }

    struct Output {
        var movie: Driver<Movie>
    }

    // MARK: Init

    func transform(input: MovieDetailViewModel.Input) -> MovieDetailViewModel.Output {
        let movieTrigger = input
            .trigger
            .flatMap { _ in return Driver
                .just(self.movie) }
        return .init(movie: movieTrigger)
    }
}
