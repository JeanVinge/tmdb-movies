//
//  Observable+Extensions.swift
//  Utility
//
//  Created by Jean Vinge on 27/12/18.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

import RxSwift
import RxCocoa

extension ObservableType {
    public var catchErrorJustComplete: Observable<Element> {
        return catchError { _ in
            return .empty()
        }
    }
    public var asDriverJustComplete: Driver<Element> {
        return asDriver { _ in
            return .empty()
        }
    }
    public var mapToVoid: Observable<Void> {
        return map { _ in }
    }
}
