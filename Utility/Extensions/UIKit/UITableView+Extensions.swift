//
//  UITableView+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

extension UITableView {

    public func dequeue<T: ContentView>(_ container: T.Type,
                                        at indexPath: IndexPath,
                                        with object: Any? = nil) -> TableViewCell<T> {
        return dequeue(reusable: TableViewCell<T>.self,
                       at: indexPath,
                       with: object)
    }

    public func dequeue<T: ContentView>(_ container: TableViewCell<T>.Type,
                                        at indexPath: IndexPath,
                                        with object: Any? = nil) -> TableViewCell<T> {
        return dequeue(reusable: TableViewCell<T>.self,
                       at: indexPath,
                       with: object)
    }

    public func dequeue<T: ReusableTableViewCell>(
        reusable: T.Type = T.self,
        at indexPath: IndexPath,
        with object: Any? = nil) -> T {
        register(reusable)
        if let cell = dequeueReusableCell(withIdentifier: reusable.reusableIdentifier,
                                          for: indexPath) as? T {
            cell.configure(at: indexPath, with: object)
            return cell
        }
        fatalError("Cell \(reusable.reusableIdentifier) not registered")
    }

    func register<T: ReusableTableViewCell>(_ reusable: T.Type = T.self) {
        register(T.self,
                 forCellReuseIdentifier: reusable.reusableIdentifier)
    }
}
