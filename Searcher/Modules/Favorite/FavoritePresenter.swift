//
//  FavoritePresenter.swift
//  Searcher
//
//  Created by Everson Trindade on 22/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class FavoritePresenter: FavoriteViewToPresenterProtocol {
    
    private lazy var interactor: FavoritePresenterToInterectorProtocol = FavoriteInteractor(self)
    private weak var delegate: FavoritePreseterToViewProtocol?
    
    init(delegate: FavoritePreseterToViewProtocol) {
        self.delegate = delegate
    }
    
    func updateView() {
        
    }
    
    func numberOfSections() -> Int {
        return 1
    }
}

extension FavoritePresenter: FavoriteInterectorToPresenterProtocol {
    
}
