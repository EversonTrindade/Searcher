//
//  HomePresenter.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class HomePresenter: HomeViewToPresenterProtocol {
    
    private lazy var interactor: HomePresenterToInteractorProtocol = HomeInteractor(self)
    var router: HomePresenterToRouterProtocol =  HomeRouter()
    private weak var delegate: HomePresenterToViewProtocol?
    
    init(_ delegate: HomePresenterToViewProtocol?) {
        self.delegate = delegate
    }
    
    func updateView() {
        delegate?.showLoaderView()
        interactor.fetchData()
    }
    
    func numberOfSections() -> Int {
        return interactor.characters.count
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {

    func didFetchData() {
        delegate?.hideLoaderView()
        delegate?.didFetchData()
    }
    
    func fail(message: String?) {
        delegate?.hideLoaderView()
        delegate?.fail(message: message ?? "")
    }
    
}
