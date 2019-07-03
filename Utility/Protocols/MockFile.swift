//
//  MockFile.swift
//  tmdb-moviesTests
//
//  Created by jean.vinge on 23/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public protocol MockFile {
    var name: String { get }
}

public extension RawRepresentable where RawValue == String, Self: MockFile {
    var name: String {
        return self.rawValue
    }
}
