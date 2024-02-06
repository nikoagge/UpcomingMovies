//
//  StarRatingView.swift
//  UpcomingMovies
//
//  Created by Nikos Aggelidis on 5/2/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import UIKit

class StarRatingView: UIView {
    private var starRating: Double = 0.0
    private var starViews: [UIImageView] = []

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
        self.starRating = starRating
        for (index, imageView) in starViews.enumerated() {
            if Double(index) < starRating {
                imageView.image = UIImage(systemName: "star.fill")
            } else if Double(index) < starRating + 0.5 {
                imageView.image = UIImage(systemName: "star.leadinghalf.fill")
            } else {
                imageView.image = UIImage(systemName: "star")
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
