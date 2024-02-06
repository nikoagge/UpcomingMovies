//
//  Double+Extension.swift
//  UpcomingMovies
//
//  Created by Nikos Aggelidis on 5/2/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import Foundation

extension Double {
    func rounded(to precision: Double) -> Double {
        return (self / precision).rounded() * precision
    }
}
