//
//  MovieDetail.swift
//  tmdb-movies
//
//  Created by jean.vinge on 21/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Utility
import Domain

final class MovieDetailView: View<MovieDetailViewModel> {

    // MARK: Var

    lazy var imageView: UIImageView = UIImageView(ViewStyle<UIImageView> {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    })
    lazy var gradientView: GradientView = GradientView(ViewStyle<GradientView> {
        $0.setup([.kinoGray,
                  UIColor.kinoGray.withAlphaComponent(0.9),
                  UIColor.kinoGray.withAlphaComponent(0.7),
                  UIColor.kinoGray.withAlphaComponent(0.7),
                  .kinoGray])
    })

    lazy var titleLabel: UILabel = UILabel(ViewStyle<UILabel> {
        $0.font = .systemFont(ofSize: 35, weight: .bold)
        $0.textColor = .white
        $0.numberOfLines = 0
    })

    lazy var componentView: UIView = UIView(ViewStyle<UIView> {
        $0.backgroundColor = .clear
    })

    lazy var genreView = GenreView()
    lazy var releaseDateView = ReleaseDateView()

    lazy var textView: UITextView = UITextView(ViewStyle<UITextView> {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textColor = .white
        $0.backgroundColor = .clear
        $0.isEditable = false
    })

    // MARK: Init

    override func initSubviews() {
        addSubview(imageView)
        addSubview(gradientView)
        addSubview(titleLabel)
        addSubview(componentView)
        componentView.addSubview(genreView)
        componentView.addSubview(releaseDateView)
        addSubview(textView)
    }

    override func initConstraints() {
        buildLayout(UIDevice.current.orientation.isLandscape)
    }

    func clearConstraint() {
        imageView.snp.removeConstraints()
        gradientView.snp.removeConstraints()
        titleLabel.snp.removeConstraints()
        titleLabel.snp.removeConstraints()
        componentView.snp.removeConstraints()
        genreView.snp.removeConstraints()
        releaseDateView.snp.removeConstraints()
        textView.snp.removeConstraints()
    }

    func buildLayout(_ isLandscape: Bool) {
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(250)
        }
        gradientView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(imageView.snp.height)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(isLandscape ? 30 : 80)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).inset(20)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).inset(20)
        }
        componentView.snp.makeConstraints { (make) in
            make.top.lessThanOrEqualTo(imageView.snp.bottom).inset(30)
            make.right.equalTo(safeAreaLayoutGuide.snp.right)
            make.left.greaterThanOrEqualToSuperview()
        }
        genreView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        releaseDateView.snp.makeConstraints { (make) in
            make.top.equalTo(genreView.snp.bottom).offset(10)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        textView.snp.makeConstraints { (make) in
            if isLandscape {
                make.top.equalTo(titleLabel.snp.bottom).offset(40)
                make.left.equalTo(safeAreaLayoutGuide.snp.left).inset(10)
                make.right.lessThanOrEqualTo(componentView.snp.left).inset(10)
            } else {
                make.top.equalTo(componentView.snp.bottom).offset(10)
                make.left.right.equalToSuperview().inset(30)
            }
            make.bottom.greaterThanOrEqualTo(safeAreaLayoutGuide.snp.bottomMargin).inset(20)
        }
    }

    override func updateConstraints() {
        super.updateConstraints()
        clearConstraint()
        initConstraints()
    }

    override func bindViewModel() {
        guard let state = self.state else { return }
        let input = MovieDetailViewModel
            .Input(trigger: state.viewWillAppear.asDriver())

        let output = viewModel?.transform(input: input)

        output?
            .movie
            .do(onNext: self.setup)
            .drive()
            .disposed(by: rx.disposeBag)
    }

    func setup(_ movie: Movie) {
        imageView.kf.setImage(with: movie.poster,
                              options: [.transition(.fade(1))])
        titleLabel.text = movie.title
        genreView.titleLabel.text = movie.genreDescription
        releaseDateView.titleLabel.text = movie.releaseFullDate
        textView.text = movie.overview
    }
}
