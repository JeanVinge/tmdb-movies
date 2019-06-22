//
//  TestViewModel.swift
//  tmdb-movies
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility
import Domain
import RxCocoa
import RxSwift
import Networking

struct MoviesViewModel: ViewModel, Transformable {

    // MARK: Var

    var router: Router?
    var useCases = MovieUseCases()

    struct Input {
        var trigger: Driver<Void>
        var paginate: Driver<Int>
        var openDetail: Driver<Movie>
    }
    struct Output {
        var movies: Driver<[Movies]>
        var openDetail: Driver<Void>
    }

    // MARK: Init

    func transform(input: Input) -> Output {
        let movies = input.trigger
            .flatMapLatest { self.useCases
            .movies(1)
            .asObservable().asDriverJustComplete }
        let newPage = input.paginate
            .flatMap { self.useCases
                .movies($0).catchError { error in
                    print(error)
                    return .just(Movies())
                }
                .asObservable().asDriverJustComplete }
        let openDetail = input
            .openDetail
            .flatMap { self.router?
                .coordinate(MoviesRouter
                    .openDetail($0)) ?? .just(()) }
        let mergedMovies = Driver<Movies>
            .merge([movies,
                    newPage]).map { MoviesRepository.shared.movies([$0]) }
        return .init(movies: mergedMovies,
                     openDetail: openDetail)
    }
}
