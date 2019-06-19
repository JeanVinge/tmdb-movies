//
//  ViewModel.swift
//  Utility
//
//  Created by Jean Vinge on 20/08/2018.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

public protocol Transformable {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}

public protocol ViewModel {
    var router: Router? { get set }
}
