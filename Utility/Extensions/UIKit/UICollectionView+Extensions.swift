//
//  UITableView+Extensions.swift
//  GenericDataSource
//
//  Created by jean.vinge on 12/02/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

extension UICollectionView {

    public func dequeue<T: ContentView>(_ container: T.Type,
                                        at indexPath: IndexPath,
                                        with object: Any? = nil) -> ContainerCell<T> {
        return dequeue(reusable: ContainerCell<T>.self,
                       at: indexPath,
                       with: object)
    }

    public func dequeue<T: ContentView>(_ container: ContainerCell<T>.Type,
                                        at indexPath: IndexPath,
                                        with object: Any? = nil) -> ContainerCell<T> {
        return dequeue(reusable: ContainerCell<T>.self,
                       at: indexPath,
                       with: object)
    }

    public func dequeue<T: ReusableCollectionCell>(
        reusable: T.Type = T.self,
        at indexPath: IndexPath,
        with object: Any? = nil) -> T {
        register(reusable)
        if let cell = dequeueReusableCell(withReuseIdentifier: reusable.reusableIdentifier,
                                               for: indexPath) as? T {
            cell.configure(at: indexPath, with: object)
            return cell
        }
        fatalError("Cell \(reusable.reusableIdentifier) not registered")
    }

    func register<T: ReusableCollectionCell>(_ reusable: T.Type = T.self) {
        register(T.self, forCellWithReuseIdentifier: reusable.reusableIdentifier)
    }
}
