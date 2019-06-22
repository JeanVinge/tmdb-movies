//
//  MoviesRepository.swift
//  tmdb-movies
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Domain

class MoviesRepository: NSObject {

    var movies: [Movies] = []
    var currentPage: Int = 1
    var totalPages: Int = 0
    var hasNextPage: Bool = false

    static let shared = MoviesRepository()

    func movies(_ newMovies: [Movies]) -> [Movies] {
        let newPage = newMovies.last?.page ?? 1
        totalPages = newMovies.last?.pages ?? 1
        if newPage == 1 {
            movies = newMovies
        } else {
            movies.append(contentsOf: newMovies)
        }
        hasNextPage = newPage < totalPages
        currentPage = newPage + 1
        return movies
    }
}
