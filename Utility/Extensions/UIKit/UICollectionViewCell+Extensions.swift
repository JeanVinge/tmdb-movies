//
//  UITableViewCell+Extensions.swift
//  GenericDataSource
//
//  Created by jean.vinge on 12/02/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    @objc func configure(at indexPath: IndexPath,
                         with object: Any? = nil) {}

    @objc func size(at indexPath: IndexPath,
                    object: Any? = nil) -> CGSize {
        configure(at: indexPath, with: object)
        return calculatedSize()
    }

    @objc func calculatedSize() -> CGSize {
        setNeedsLayout()
        layoutIfNeeded()
        return contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
