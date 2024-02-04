//
//  UpcomingMoviesLayoutProvider.swift
//  UpcomingMovies
//
//  Created by Alonso on 2/04/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

import UIKit

struct UpcomingMoviesLayoutProvider: UpcomingMoviesLayoutProviderProtocol {

    func collectionViewLayout(for presentationMode: UpcomingMoviesPresentationMode, and collectionViewWidth: CGFloat) -> UICollectionViewLayout {
        switch presentationMode {
        case .detail:
            let detailLayoutWidth = collectionViewWidth - Constants.detailCellOffset
            return VerticalFlowLayout(preferredWidth: detailLayoutWidth, preferredHeight: Constants.detailCellHeight)
        }
    }

    struct Constants {

        static let previewCellHeight: CGFloat = 150.0

        static let detailCellHeight: CGFloat = 200.0
        static let detailCellOffset: CGFloat = 32.0

        static let previewLayoutMinColumns: Int = 1

    }

}
