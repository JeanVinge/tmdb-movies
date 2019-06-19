//
//  BindableType.swift
//  Utility
//
//  Created by Jean Vinge on 15/06/2018.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

import RxSwift

public protocol ViewModable {
    associatedtype ViewModelType
    var viewModel: ViewModelType? { get set }
    init(_ viewModel: ViewModelType)
}

public typealias ViewTransformable = UIView & ViewModable & BindableView

public protocol BindableView {
    var state: Stateable? { get set }
    func bindViewModel()
    func setup(_ state: Stateable, router: Router?)
}
