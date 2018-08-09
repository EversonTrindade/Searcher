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
        delegate?.showLoader()
        interactor.fetchData()
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {

    func didFetchData(data: HomeEntity) {
        delegate?.hideLoader()
        delegate?.showData(data: data) //data volta pra view??????
    }
    
    func fail(message: String?) {
        delegate?.hideLoader()
        delegate?.fail(message: message ?? "")
    }
    
}
