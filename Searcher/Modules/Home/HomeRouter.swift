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
        guard let detailView = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        detailView.fill(dto: characterDTO)
        view.navigationController?.pushViewController(detailView, animated: true)
    }
}
