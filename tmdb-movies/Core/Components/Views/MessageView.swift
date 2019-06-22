//
//  MessageView.swift
//  tmdb-movies
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility
import Resources

class MessageView: GenericView {

    // MARK: Var

    lazy var titleLabel: UILabel = UILabel(ViewStyle<UILabel> {
        $0.text = L10n.General.couldNotLoadInformation
        $0.font = .systemFont(ofSize: 20, weight: .medium)
        $0.textColor = .white
    })

    lazy var button: UIButton = UIButton(ViewStyle<UIButton> {
        $0.setTitle(L10n.General.tryAgain, for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    })

    // MARK: Init

    override func initSubviews() {
        addSubview(titleLabel)
        addSubview(button)
    }

    override func initConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
        }
        button.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
