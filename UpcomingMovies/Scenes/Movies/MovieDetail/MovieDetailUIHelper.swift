//
//  MovieDetailUIHelper.swift
//  UpcomingMovies
//
//  Created by Alonso on 16/01/22.
//  Copyright © 2022 Alonso. All rights reserved.
//

import UIKit

final class MovieDetailUIHelper: MovieDetailUIHelperProtocol, LoadingDisplayable, Retryable {

    private let skeletonProgressAdapter: SkeletonProgressAdapterProtocol

    // MARK: - LoadingDisplayable

    var loaderView: LoadingView = RadarView()

    // MARK: - Initializers

    init(skeletonProgressAdapter: SkeletonProgressAdapterProtocol) {
        self.skeletonProgressAdapter = skeletonProgressAdapter
    }

    func showSkeleton(in view: UIView) {
        skeletonProgressAdapter.showSkeletonLoading(in: view)
    }
}
