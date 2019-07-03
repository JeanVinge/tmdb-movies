//
//  ViewStyle.swift
//  Utility
//
//  Created by jean.vinge on 14/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import Utility

public typealias ViewStylizable<T> = (T) -> Void

public struct ViewStyle<T> {
    public let style: ViewStylizable<T>
}

public extension ViewStyle {
    func compose(with style: ViewStyle<T>) -> ViewStyle<T> {
        return ViewStyle<T> {
            self.style($0)
            style.style($0)
        }
    }
}

public func style<T>(_ object: T,
                     with style: ViewStyle<T>) {
    style.style(object)
}

public protocol Stylable {
    init()
}

extension UIView: Stylable {}

public extension Stylable {
    init(_ style: ViewStyle<Self>) {
        self.init()
        apply(style)
    }
    func apply(_ style: ViewStyle<Self>) {
        style.style(self)
    }
}
