//
//  StarRatingViewUnitTests.swift
//  UpcomingMoviesTests
//
//  Created by Nikos Aggelidis on 6/2/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import XCTest
@testable import UpcomingMovies

final class StarRatingViewTests: XCTestCase {
    var starRatingView: StarRatingView!

    override func setUpWithError() throws {
        super.setUp()
        starRatingView = StarRatingView(frame: CGRect(x: 0, y: 0, width: 100, height: 20), starRating: 0.0)
    }

    override func tearDownWithError() throws {
        starRatingView = nil
        super.tearDown()
    }

    func testStarRatingView_WhenGivenMaxRating_ShouldShowAllFilledStars() {
        // Given
        let maxRating = 5.0
        
        // When
        starRatingView.updateStarRating(starRating: maxRating)
        
        // Then
        for imageView in starRatingView.starViews {
            XCTAssertEqual(imageView.image, UIImage(systemName: "star.fill"), "Star image should be filled for max rating.")
        }
    }
    
    func testStarRatingView_WhenGivenMinRating_ShouldShowAllEmptyStars() {
        // Given
        let minRating = 0.0
        
        // When
        starRatingView.updateStarRating(starRating: minRating)
        
        // Then
        for imageView in starRatingView.starViews {
            XCTAssertEqual(imageView.image, UIImage(systemName: "star"), "Star image should be empty for min rating.")
        }
    }
    
    func testStarRatingView_WhenGivenHalfRating_ShouldShowHalfStars() {
        // Given
        let halfRating = 2.5

        // When
        starRatingView.updateStarRating(starRating: halfRating)

        // Then
        for (index, imageView) in starRatingView.starViews.enumerated() {
            if index < 2 {
                XCTAssertEqual(imageView.image, UIImage(systemName: "star.fill"), "The star at index \(index) should be filled.")
            } else if index == 2 {
                XCTAssertEqual(imageView.image, UIImage(systemName: "star.leadinghalf.fill"), "The star at index \(index) should be half filled.")
            } else {
                XCTAssertEqual(imageView.image, UIImage(systemName: "star"), "The star at index \(index) should be empty.")
            }
        }
    }

}
