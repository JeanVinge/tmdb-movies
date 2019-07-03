//
//  Primitive+Extensions.swift
//  Networking
//
//  Created by jean.vinge on 19/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxSwift
import RxCocoa

public extension PrimitiveSequence where Trait == SingleTrait,
Element == Response {

    func mapJSON(failsOnEmptyData: Bool = true) -> Single<Any> {
        return flatMap { .just(try $0.mapJSON(failsOnEmptyData: failsOnEmptyData)) }
    }

    func mapString(atKeyPath keyPath: String? = nil) -> Single<String> {
        return flatMap { .just(try $0.mapString(atKeyPath: keyPath)) }
    }

    func map<D: Decodable>(_ type: D.Type,
                           atKeyPath keyPath: String? = nil,
                           using decoder: JSONDecoder = JSONDecoder(),
                           failsOnEmptyData: Bool = true) -> Single<D> {
        return flatMap { .just(try $0.map(type,
                                          atKeyPath: keyPath,
                                          using: decoder,
                                          failsOnEmptyData: failsOnEmptyData)) }
    }
}
