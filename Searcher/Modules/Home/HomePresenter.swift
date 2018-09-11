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
    private var offset = 0
    var canLoad = true
    
    init(delegate: HomePresenterToViewProtocol?, routerProtocol: HomePresenterToRouterProtocol?) {
        self.delegate = delegate
        router = HomeRouter(view: routerProtocol!)
    }
    
    func updateFetchedData() {
        if canLoad {
            offset += 1
            canLoad = false
            delegate?.showLoaderView()
            interactor.fetchData(offset: offset)
        }
    }
    
    func updateView() {
        delegate?.showLoaderView()
        canLoad = false
        interactor.fetchData(offset: 0)
    }
    
    func numberOfSections() -> Int {
        return interactor.characters.count
    }
    
    func getCharacter(at index: Int) -> CharacterDTO {
        guard let dto = interactor.characters.object(index: index) else {
            return CharacterDTO()
        }
        return CharacterDTO(id: dto.id ?? 0,
                            image: interactor.getImageFrom(url: dto.thumbnail!.file, identifier: dto.id ?? 0),
                            name: dto.name ?? "")
    }
    
    func presentNextView(with index: Int) {
        if let dto = interactor.characters.object(index: index) {
            router?.presentDetailView(characterDTO: CharacterDTO(id: dto.id ?? 0,
                                                                image: interactor.getImageFromCache(with: dto.id ?? 0),
                                                                name: dto.name ?? ""))
        }
    }
    
    func didFavorite(with id: Int, shouldFavorite: Bool, imageData: Data?) {
        
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {

    func didFetchData() {
        canLoad = true
        delegate?.hideLoaderView()
        delegate?.didFetchData()
    }
    
    func fail(message: String?) {
        canLoad = true
        delegate?.hideLoaderView()
        delegate?.fail(message: message ?? "")
    }
    
    func didLoadImage(identifier: Int) {
        delegate?.didLoadImage(image: interactor.getImageFromCache(with: identifier), identifier: identifier)
    }
}
