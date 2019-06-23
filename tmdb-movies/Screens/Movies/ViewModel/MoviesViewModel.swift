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
        var pullRefresh: Driver<Void>
        var paginate: Driver<Int>
        var openDetail: Driver<Movie>
        var filter: Driver<String>
    }
    struct Output {
        var movies: Driver<[Movies]>
        var openDetail: Driver<Void>
        var trackActivity: Driver<LoadingView.State>
        var hasNextPage: Driver<Bool>
    }

    // MARK: Init

    func transform(input: Input) -> Output {

        let trackActivity = ActivityIndicator()

        let firstPage = self.useCases.movies(1)

        let trigger = input
            .trigger
            .flatMap { _ in firstPage
                .asObservable()
                .trackActivity(trackActivity)
                .asDriverJustComplete }

        let pull = input
            .pullRefresh
            .flatMap { firstPage
                .asObservable()
                .asDriverJustComplete }

        let movies = Driver<Movies>.merge([trigger,
                                           pull])

        let newPage = input.paginate
            .flatMapLatest { self.useCases
                .movies($0)
                .asObservable().asDriverJustComplete }

        let openDetail = input
            .openDetail
            .flatMapLatest { self.router?
                .coordinate(MoviesRouter
                    .openDetail($0)) ?? .just(()) }

        let fetching = input
            .filter
            .map { MoviesRepository.shared.search($0) }.debug()

        let mergedMovies = Driver<Movies>
            .merge([movies, newPage]).map { MoviesRepository.shared.movies([$0]) }

        let combinedMovies = Driver<[Movies]>
            .merge([fetching, mergedMovies])

        return .init(movies: combinedMovies,
                     openDetail: openDetail,
                     trackActivity: trackActivity.asDriver(),
                     hasNextPage: combinedMovies
                        .map { _ in MoviesRepository.shared.hasNextPage })
    }
}
