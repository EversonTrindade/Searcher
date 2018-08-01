//
//  HomeViewController.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

class HomeView: UIViewController {

    lazy var presenter: HomeViewToPresenterProtocol = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updateView()
    }

}

extension HomeView: HomePresenterToViewProtocol {
    
    func showData(data: HomeEntity) {
        
    }
    
}
