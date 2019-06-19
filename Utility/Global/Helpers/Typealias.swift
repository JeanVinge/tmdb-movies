//
//  Typealias.swift
//  Coordinator
//
//  Created by Jean Vinge on 17/01/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Foundation
import RxDataSources

typealias JSONDictionary = [String: Any]

typealias IndexPathCompletion = (IndexPath) -> Void

typealias EmptyCompletion = () -> Void

typealias ErrorCompletion = (Error) -> Void

typealias OneSectionAnimatableModel<T: IdentifiableType & Equatable> = AnimatableSectionModel<String, T>

typealias OneSectionModel<T: Codable> = SectionModel<String, T>
typealias OneAnySectionModel<T: Any> = SectionModel<String, T>
