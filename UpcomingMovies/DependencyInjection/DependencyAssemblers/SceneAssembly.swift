//
//  SceneAssembly.swift
//  UpcomingMovies
//
//  Created by Alonso on 9/13/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Swinject

final class SceneAssembly: Assembly {

    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            SplashAssembly(),
            UpcomingMoviesAssembly(),
            MovieDetailAssembly(),
            SearchMoviesAssembly(),
            MovieListAssembly(),
            MovieCreditsAssembly(),
            MovieVideosAssembly(),
            MovieReviewsAssembly(),
            MovieReviewDetailAssembly()
        ]
        assemblies.forEach { $0.assemble(container: container) }
    }

}
