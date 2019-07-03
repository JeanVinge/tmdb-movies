//
//  ContainerCellConvertible.swift
//  Utility
//
//  Created by jean.vinge on 20/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

public enum ContentResize {
    case height(CGFloat)
    case width(CGFloat)
    case size(CGSize)
}

public protocol ContainerCellConvertible {
    var resize: ContentResize { get }
    func prepareForReuse()
    init()
    func setup(with data: Any)
}
