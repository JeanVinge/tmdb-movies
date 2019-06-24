//
//  MoviesViewTests.swift
//  tmdb-moviesTests
//
//  Created by jean.vinge on 24/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

@testable import tmdb_movies

import XCTest

class MoviesViewTests: XCTestCase {

    var view = MoviesView()

    func test_if_is_in_on_screen() {
        XCTAssertTrue(view.collectionView.isDescendant(of: view))
        XCTAssertTrue(view.searchBar.isDescendant(of: view))
    }

}
