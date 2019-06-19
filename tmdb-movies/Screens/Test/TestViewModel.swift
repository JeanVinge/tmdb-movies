//
//  TestViewModel.swift
//  tmdb-movies
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility
import RxCocoa
import RxSwift

struct TestViewModel: ViewModel, Transformable {

    var router: Router?

    struct Input {
        var title: Driver<Void>
    }
    struct Output {
        var title: Driver<String>
    }

    func transform(input: Input) -> Output {
        return .init(title: .just("EAEAEAEAEA"))
    }
}
