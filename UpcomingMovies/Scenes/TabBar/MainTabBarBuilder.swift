//
//  MainTabBarBuilder.swift
//  UpcomingMovies
//
//  Created by Alonso on 11/1/19.
//  Copyright © 2019 Alonso. All rights reserved.
//

import UIKit
import UpcomingMoviesDomain

struct RootCoordinatorIdentifier {
    static let upcomingMovies = "upcoming"
    static let searchMovies = "search"
}

final class MainTabBarBuilder {

    class func buildViewCoordinators() -> [RootCoordinator] {

        let upcomingMoviesNavigationController = createNavigationController(title: "Upcoming", image: #imageLiteral(resourceName: "Movies"))
        let upcomingMoviesCoordinator = UpcomingMoviesCoordinator(navigationController: upcomingMoviesNavigationController,
                                                                  navigationDelegate: UpcomingMoviesNavigation())
        upcomingMoviesCoordinator.start(coordinatorMode: .push)

        let searchMoviesNavigationController = createNavigationController(title: "Search", image: #imageLiteral(resourceName: "Search"))
        let searchMoviesCoordinator = SearchMoviesCoordinator(navigationController: searchMoviesNavigationController)
        searchMoviesCoordinator.start(coordinatorMode: .push)

        return [
            upcomingMoviesCoordinator,
            searchMoviesCoordinator
        ]
    }

    class func createNavigationController(title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image

        return navController
    }

}
