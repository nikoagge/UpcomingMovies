//
//  MovieCreditsProtocols.swift
//  UpcomingMovies
//
//  Created by Alonso on 6/27/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

protocol MovieCreditsViewModelProtocol {
    
    var movieTitle: String { get set }
    
    var viewState: Bindable<MovieCreditsViewState> { get }
    var didToggleSection: Bindable<Int> { get }
    var startLoading: Bindable<Bool> { get }
 
    func numberOfSections() -> Int
    func numberOfItems(for section: Int) -> Int
    
    func creditModel(for section: Int, and index: Int) -> MovieCreditCellViewModel
    func headerModel(for index: Int) -> CollapsibleHeaderViewModel
    
    func toggleSection(_ section: Int)
    func getMovieCredits(showLoader: Bool)
    
}

protocol MovieCreditsCoordinatorProtocol: class {}