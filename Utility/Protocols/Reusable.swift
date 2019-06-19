//
//  Reusable.swift
//  GenericDataSource
//
//  Created by jean.vinge on 12/02/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public protocol Reusable {
    static var reusableIdentifier: String { get }
}

public extension Reusable {
    static var reusableIdentifier: String {
        return "\(Self.self)"
    }
}
