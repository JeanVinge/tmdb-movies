//
//  SharedSequenceConvertibleType+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import RxSwift
import RxCocoa

extension SharedSequenceConvertibleType {
    public var mapToVoid: SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
}
