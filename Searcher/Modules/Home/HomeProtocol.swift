//
//  HomeProtocol.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewToPresenterProtocol: class {
    var canLoad: Bool { get set }
    func updateView()
    func numberOfSections() -> Int
    func getCharacter(at index: Int) -> CharacterDTO
    func presentNextView(with index: Int)
    func updateFetchedData()
}

protocol HomePresenterToViewProtocol: class {
    func showLoaderView()
    func hideLoaderView()
    func didFetchData()
    func fail(message: String)
}

protocol HomePresenterToInteractorProtocol: class {
    var characters: [Character] { get set }
    func fetchData(offset: Int)
}

protocol HomeInteractorToPresenterProtocol: class {
    func didFetchData()
    func fail(message: String?)
}

protocol HomePresenterToRouterProtocol: class {
    var navigationController: UINavigationController? { get }
}
