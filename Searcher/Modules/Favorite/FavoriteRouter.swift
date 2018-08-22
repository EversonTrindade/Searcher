//
//  FavoriteRouter.swift
//  Searcher
//
//  Created by Everson Trindade on 22/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class FavoriteRouter {
    
    var view: FavoritePresenterToRouterProtocol?
    
    init(view: FavoritePresenterToRouterProtocol) {
        self.view = view
    }
}
