//
//  MovieCell.swift
//  tmdb-movies
//
//  Created by jean.vinge on 20/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility
import Domain
import Kingfisher
import Resources

struct MovieSize {
    private static func cardHeight() -> CGFloat {
        return 350
    }
    private static func cardWidth() -> CGFloat {
        let window = UIApplication.shared.keyWindow
        let topPadding = window?.safeAreaInsets.left ?? 0
        let bottomPadding = window?.safeAreaInsets.right ?? 0
        let width = UIScreen.main.bounds.width - topPadding - bottomPadding
        let factor: CGFloat = width < 600 ? 2 : 4
        return (width / factor) - width.truncatingRemainder(dividingBy: factor)
    }
    static var cardSize: CGSize {
        return CGSize(width: cardWidth(), height: cardHeight())
    }
}

final class MovieCell: GenericView, ContainerCellConvertible {

    // MARK: Var

    typealias Configuration = Movie
    var resize: ContentResize = .size(MovieSize.cardSize)

    lazy var imageView = UIImageView(ViewStyle<UIImageView> {
        $0.contentMode = .scaleAspectFill
    })

    lazy var titleLabel = UILabel(ViewStyle<UILabel> {
        $0.font = .systemFont(ofSize: 16, weight: .heavy)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .left
    })

    lazy var releaseDataView = ReleaseDateView()
    lazy var genreView = GenreView()

    // MARK: Init

    func prepareForReuse() {
        imageView.kf.cancelDownloadTask()
        titleLabel.text = ""
        releaseDataView.titleLabel.text = ""
        genreView.titleLabel.text = ""
    }

    override func initSubviews() {
        addSubview(imageView)
        addSubview(genreView)
        addSubview(titleLabel)
        addSubview(releaseDataView)
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
    }

    override func initConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview().inset(10)
            make.height.equalTo(MovieSize.cardSize.height * 0.76)
        }
        genreView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.top)
            make.left.greaterThanOrEqualToSuperview().inset(50)
            make.right.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(10)
        }
        releaseDataView.snp.makeConstraints { (make) in
            make.top.greaterThanOrEqualTo(titleLabel.snp.bottom)
            make.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview()
        }
    }

    func setup(with data: Any) {
        guard let data = data as? Movie else { return }
        titleLabel.text = data.title
        releaseDataView.titleLabel.text = data.releaseFullDate
        imageView.kf.setImage(with: data.poster, options: [.transition(.fade(1))])
        genreView.titleLabel.text = data.genreDescription
    }
}
