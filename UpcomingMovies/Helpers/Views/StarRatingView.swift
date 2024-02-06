//
//  StarRatingView.swift
//  UpcomingMovies
//
//  Created by Nikos Aggelidis on 5/2/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import UIKit

class StarRatingView: UIView {
    var starRating: Double = 0.0
    var starViews: [UIImageView] = []

    init(frame: CGRect, starRating: Double) {
        super.init(frame: frame)
        self.starRating = starRating
        setupStars()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStars()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let starSize = self.bounds.width / CGFloat(starViews.count)
        for (index, starView) in starViews.enumerated() {
            starView.frame = CGRect(x: CGFloat(index) * starSize, y: 0, width: starSize, height: self.bounds.height)
        }
    }
    
    func updateStarRating(starRating: Double) {
        // Round the rating to the nearest 0.5
        let roundedRating = (starRating * 2).rounded() / 2

        for (index, imageView) in starViews.enumerated() {
            if Double(index) + 0.5 == roundedRating {
                imageView.image = UIImage(systemName: "star.leadinghalf.fill") // For half-filled star
            } else if Double(index) < roundedRating {
                imageView.image = UIImage(systemName: "star.fill") // For fully filled stars
            } else {
                imageView.image = UIImage(systemName: "star") // For empty stars
            }
        }
    }

    
    private func setupStars() {
        for _ in 0..<5 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.tintColor = .yellow
            starViews.append(imageView)
            addSubview(imageView)
        }
        updateStarRating(starRating: starRating)
    }
}
