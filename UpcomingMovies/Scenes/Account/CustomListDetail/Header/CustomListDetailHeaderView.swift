//
//  CustomListDetailHeaderView.swift
//  UpcomingMovies
//
//  Created by Alonso on 4/20/19.
//  Copyright © 2019 Alonso. All rights reserved.
//

import UIKit
import Kingfisher

class CustomListDetailHeaderView: UIView, NibLoadable {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: CustomListDetailHeaderViewModel? {
        didSet {
            setupBindables()
        }
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Reactive Behaviour
    
    private func setupBindables() {
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.name
        if let description = viewModel.description {
            descriptionLabel.text = description
        } else {
            descriptionView.isHidden = true
        }
        posterImageView.kf.indicatorType = .activity
        posterImageView.kf.setImage(with: viewModel.posterURL)
    }

}
