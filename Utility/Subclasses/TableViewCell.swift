//
//  TableViewCell.swift
//  Utility
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

public typealias ReusableTableViewCell = UITableViewCell & Reusable

final public class TableViewCell<T: ContentView>: ReusableTableViewCell, ConfigurableView {

    lazy var wrappedView = T.init()

    public override func prepareForReuse() {
        super.prepareForReuse()
        wrappedView.prepareForReuse()
    }

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
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
        wrappedView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }

        switch wrappedView.resize {
        case .height(let height):
            wrappedView.snp.makeConstraints { (make) in
                make.height.equalTo(height)
            }
        case .width(let width):
            wrappedView.snp.makeConstraints { (make) in
                make.width.equalTo(width)
            }
        case .size(let size):
            wrappedView.snp.makeConstraints { (make) in
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
