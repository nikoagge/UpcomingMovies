//
//  ProgressHUDAdapterProtocol.swift
//  UpcomingMovies
//
//  Created by Alonso on 16/01/22.
//  Copyright © 2022 Alonso. All rights reserved.
//

import UIKit

protocol SkeletonProgressAdapterProtocol {
    func showSkeletonLoading(in view: UIView)
    func hideSkeletonLoading(in view: UIView)
}
