//
//  ContainerCell.swift
//  Utility
//
//  Created by jean.vinge on 20/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit
import SnapKit

public typealias ContentView = UIView & ContainerCellConvertible
public typealias ReusableCollectionCell = UICollectionViewCell & Reusable

final public class ContainerCell<T: ContentView>: ReusableCollectionCell, ConfigurableView {

    lazy var wrappedView = T.init()

    public override func prepareForReuse() {
        super.prepareForReuse()
        wrappedView.prepareForReuse()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLayout()
    }

    public func initSubviews() {
        contentView.addSubview(wrappedView)
    }

    public func initConstraints() {
        contentView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        wrappedView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }

        switch wrappedView.resize {
        case .height(let height):
            contentView.snp.makeConstraints { (make) in
                make.height.equalTo(height)
            }
        case .width(let width):
            contentView.snp.makeConstraints { (make) in
                make.width.equalTo(width)
            }
        case .size(let size):
            contentView.snp.makeConstraints { (make) in
                make.width.equalTo(size.width)
                make.height.equalTo(size.height)
            }
        }
    }

    override func configure(at indexPath: IndexPath, with object: Any? = nil) {
        if let object = object {
            wrappedView.setup(with: object)
        }
    }
}
