//
//  UpcomingMovieExpandedCollectionViewCell.swift
//  UpcomingMovies
//
//  Created by Alonso on 3/9/19.
//  Copyright © 2019 Alonso. All rights reserved.
//

import UIKit

final class UpcomingMovieExpandedCollectionViewCell: UICollectionViewCell, UpcomingMovieCollectionViewCellProtocol {
    @IBOutlet private weak var backdropImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet weak var starRatingView: StarRatingView!
    
    var viewModel: UpcomingMovieCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        backdropImageView.cancelImageDownload()
        backdropImageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        isAccessibilityElement = true

        titleLabel.font = FontHelper.headlineBold
        titleLabel.adjustsFontForContentSizeCategory = true
        releaseDateLabel.font = FontHelper.body
        releaseDateLabel.adjustsFontForContentSizeCategory = true
    }

    private func setupBindables() {
        guard let viewModel = viewModel else { return }

        titleLabel.text = viewModel.title
        accessibilityLabel = viewModel.title
        
        let date = viewModel.releaseDate ?? "2024-02-05"
        releaseDateLabel.text = date.formattedDate(from: .yyMMdd, to: .dMMMyyyy)
        let rating = ((viewModel.voteAverage ?? 0) / 2).rounded(to: 0.5)
        starRatingView.updateStarRating(starRating: rating)
        backdropImageView.setImage(with: viewModel.backdropURL)
    }
}
