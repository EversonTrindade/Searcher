//
//  HomeViewController.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var presenter: HomeViewToPresenterProtocol = HomePresenter(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updateView()
    }
}

extension HomeViewController: HomePresenterToViewProtocol {
    
    func showLoader() {
        
    }
    
    func hideLoader() {
        
    }

    func showData(data: HomeEntity) {
        
    }
    
    func fail(message: String) {
        present(Alert.showAlert(message: message), animated: true, completion: nil)
    }
}