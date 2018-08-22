//
//  FavoriteInterector.swift
//  Searcher
//
//  Created by Everson Trindade on 22/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class FavoriteInteractor: FavoritePresenterToInterectorProtocol {
    
    private weak var delegate: FavoriteInterectorToPresenterProtocol?
    
    init(_ delegate: FavoriteInterectorToPresenterProtocol) {
        self.delegate = delegate
    }
    
    
}
