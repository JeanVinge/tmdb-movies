//
//  Errors.swift
//  Coordinator
//
//  Created by Jean Vinge on 17/01/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

enum Errors: Error {
    case cellCantBeNil(String)
    case baseURLCantBeNil
    case codableError
    case mediaCantBeNil
    case requestError
    case couldNotLoad
}

extension Errors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .cellCantBeNil(let cell):
            return "the cell \(cell), can't be nil."
        case .baseURLCantBeNil:
            return "Base URL shouldn't be nil."
        case .codableError:
            return "Unknown codable error."
        case .mediaCantBeNil:
            return "Media can't be nil."
        case .requestError:
            return "Request didn't complete."
        case .couldNotLoad:
            return "Não foi possivel carregar o conteúdo."
        }
    }
}
