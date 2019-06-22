//
//  MoviesUseCases.swift
//  Domain
//
//  Created by jean.vinge on 19/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxSwift

public protocol MovieUseCases {
    func movies(_ page: Int) -> Single<Movies>
}
