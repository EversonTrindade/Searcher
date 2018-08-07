//
//  HomeProtocol.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

protocol HomeViewToPresenterProtocol: class {
    func updateView()
}

protocol HomePresenterToViewProtocol: class {
    func showData(data: HomeEntity)
    func fail(message: String)
}

protocol HomePresenterToInteractorProtocol: class {
    func fetchData()
}

protocol HomeInteractorToPresenterProtocol: class {
    func didFetchData(data: HomeEntity)
    func fail(message: String?)
}
