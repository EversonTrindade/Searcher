//
//  HomePresenter.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class HomePresenter: HomeViewToPresenterProtocol {
    
    var interactor: HomePresenterToInteractorProtocol?
    weak var view: HomePresenterToViewProtocol?
    
    func updateView() {
        interactor?.fetchData()
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    func didFetchData(data: HomeEntity) {
        view?.showData(data: data)
    }
    
    func failFetchData() {
        
    }
}
