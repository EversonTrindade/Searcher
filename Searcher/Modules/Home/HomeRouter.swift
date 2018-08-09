//
//  HomeRouter.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit


class HomeRouter: HomePresenterToRouterProtocol {
    
    func createHomeModule() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
    }
    
    func presentNextView() {
        
    }
}
