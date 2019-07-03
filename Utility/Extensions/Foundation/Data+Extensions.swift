//
//  Data+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 23/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Foundation

public extension Data {

    init(_ mock: MockFile,
         bundle: Bundle = Bundle.main) {
        self.init(json: mock.name,
                  bundle: bundle)
    }

    init(from resource: String, ext: String, bundle: Bundle) {
        guard let path = bundle.path(forResource: resource, ofType: ext) else {
            fatalError("path can't be nil")
        }
        do {
            try self.init(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

    init(json filename: String, bundle: Bundle) {
        self.init(from: filename, ext: "json", bundle: bundle)
    }

    func JSONPretty(data: Data) -> Data {
        do {
            return try JSONSerialization
                .data(withJSONObject:
                    try JSONSerialization
                        .jsonObject(with: data),
                      options: .prettyPrinted)
        } catch {
            return data
        }
    }
}
