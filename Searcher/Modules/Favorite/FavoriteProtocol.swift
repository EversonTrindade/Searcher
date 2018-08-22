//
//  FavoriteProtocol.swift
//  Searcher
//
//  Created by Everson Trindade on 22/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation
import UIKit

protocol FavoriteViewToPresenterProtocol: class {
    func updateView()
    func numberOfSections() -> Int
}

protocol FavoritePreseterToViewProtocol: class {
    
}

protocol FavoritePresenterToInterectorProtocol: class {
    
}

protocol FavoriteInterectorToPresenterProtocol: class {
    
}

protocol FavoritePresenterToRouterProtocol: class {
    var navigationController: UINavigationController? { get }
}
