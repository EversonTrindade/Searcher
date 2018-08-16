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
    var router: HomeRouter?
    private weak var delegate: HomePresenterToViewProtocol?
    
    init(delegate: HomePresenterToViewProtocol?, routerProtocol: HomePresenterToRouterProtocol?) {
        self.delegate = delegate
        router = HomeRouter(view: routerProtocol!)
    }
    
    func updateView() {
        delegate?.showLoaderView()
        interactor.fetchData()
    }
    
    func numberOfSections() -> Int {
        return interactor.characters.count
    }
    
    func getCharacter(at index: Int) -> CharacterDTO {
        guard let dto = interactor.characters.object(index: index) else {
            return CharacterDTO()
        }
        return CharacterDTO(id: dto.id, image: dto.thumbnail.file, name: dto.name)
    }
    
    func presentNextView(with index: Int) {
        if let dto = interactor.characters.object(index: index) {
            router?.presentDetailView(characterDTO: CharacterDTO(id: dto.id,
                                                                image: dto.thumbnail.file,
                                                                name: dto.name))
        }
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
