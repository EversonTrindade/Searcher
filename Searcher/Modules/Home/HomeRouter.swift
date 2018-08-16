//
//  HomeRouter.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter {
    
    var view: HomePresenterToRouterProtocol
    
    init(view: HomePresenterToRouterProtocol) {
        self.view = view
    }
    
    func presentDetailView(characterDTO: CharacterDTO) {
        if let detailViewController = DetailRouter().createDetailModule() as? DetailViewController {
            detailViewController.fill(characterDTO: characterDTO)
            if let navigation = view.navigationController {
                navigation.pushViewController(detailViewController, animated: true)
            }
        }
    }
}
