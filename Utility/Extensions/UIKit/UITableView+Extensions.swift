//
//  UITableView+Extensions.swift
//  GenericDataSource
//
//  Created by jean.vinge on 12/02/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell & Reusable>(
        reusable: T.Type = T.self,
        at indexPath: IndexPath,
        with object: Any? = nil) -> T {
        self.register(reusable)
        if let cell = self.dequeueReusableCell(withIdentifier: reusable.reusableIdentifier,
                                               for: indexPath) as? T {
            cell.configure(at: indexPath, with: object)
            return cell
        }
        fatalError("Cell \(reusable.reusableIdentifier) not registered")
    }
    func register<T: UITableViewCell & Reusable>(_ reusable: T.Type = T.self) {
        self.register(T.self, forCellReuseIdentifier: reusable.reusableIdentifier)
    }
}
