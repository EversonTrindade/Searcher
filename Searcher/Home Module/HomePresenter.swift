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
    private weak var delegate: HomePresenterToViewProtocol?
    
    init(_ delegate: HomePresenterToViewProtocol?) {
        self.delegate = delegate
    }
    
    func updateView() {
        interactor.fetchData()
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {

    func didFetchData(data: HomeEntity) {
        delegate?.showData(data: data)
    }
    
    func fail(message: String?) {
        delegate?.fail(message: message ?? "")
    }
    
}
