//
//  MoviesRepository.swift
//  tmdb-movies
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Domain

class MoviesRepository: NSObject {

    var storedMovies: [Movies] = []
    var nextPage: Int = 1
    var totalPages: Int = 0
    var isSearching: Bool = false
    var hasNextPage: Bool {
        return (nextPage < totalPages) && !isSearching
    }

    static let shared = MoviesRepository()

    func search(_ text: String) -> [Movies] {
        isSearching = text.count > 0
        if isSearching {
            return storedMovies.map { movies in
                var mmovies = movies
                mmovies.results = movies
                    .results
                    .filter { $0
                        .title
                        .lowercased()
                        .contains(text.lowercased()) }
                return mmovies
            }
        } else {
            return storedMovies
        }
    }

    func add(_ movies: Movies) -> [Movies] {
        totalPages = movies.pages
        _ = movies.page == 1 ? storedMovies = [movies] : storedMovies.append(movies)
        nextPage = movies.page + 1
        return storedMovies
    }
}
