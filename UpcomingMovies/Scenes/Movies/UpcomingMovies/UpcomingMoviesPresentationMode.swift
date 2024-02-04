//
//  UpcomingMoviesDisplayMode.swift
//  UpcomingMovies
//
//  Created by Alonso on 7/02/23.
//  Copyright © 2023 Alonso. All rights reserved.
//

enum UpcomingMoviesPresentationMode: Int {
    case detail

    var cellIdentifier: String {
        switch self {
        case .detail:
            return UpcomingMovieExpandedCollectionViewCell.dequeueIdentifier
        }
    }
}
