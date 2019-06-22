//
//  ObservableType+Extension.swift
//  Networking
//
//  Created by jean.vinge on 19/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxSwift

public extension ObservableType where Element == Response {

    func mapJSON(failsOnEmptyData: Bool = true) -> Observable<Any> {
        return flatMap { Observable.just(try $0.mapJSON(failsOnEmptyData: failsOnEmptyData)) }
    }

    func mapString(atKeyPath keyPath: String? = nil) -> Observable<String> {
        return flatMap { Observable.just(try $0.mapString(atKeyPath: keyPath)) }
    }

    func map<D: Decodable>(_ type: D.Type,
                           atKeyPath keyPath: String? = nil,
                           using decoder: JSONDecoder = JSONDecoder(),
                           failsOnEmptyData: Bool = true) -> Observable<D> {
        return flatMap { Observable.just(try $0.map(type,
                                                    atKeyPath: keyPath,
                                                    using: decoder,
                                                    failsOnEmptyData: failsOnEmptyData)) }
    }
}
