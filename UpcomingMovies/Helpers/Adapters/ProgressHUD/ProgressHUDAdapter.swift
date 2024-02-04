//
//  ProgressHUDAdapter.swift
//  UpcomingMovies
//
//  Created by Alonso on 19/01/22.
//  Copyright © 2022 Alonso. All rights reserved.
//

import SkeletonView

final class SkeletonProgressAdapter: SkeletonProgressAdapterProtocol {
    func showSkeletonLoading(in view: UIView) {
        view.isSkeletonable = true
        let gradient = SkeletonGradient(baseColor: .clouds)
        let animation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
        view.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation)
    }

    func hideSkeletonLoading(in view: UIView) {
        view.hideSkeleton()
    }
}
