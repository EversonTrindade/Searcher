//
//  HomeInterector.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class HomeInteractor: HomePresenterToInteractorProtocol {
    
    private weak var delegate: HomeInteractorToPresenterProtocol?
    
    init(_ delegate: HomeInteractorToPresenterProtocol?) {
        self.delegate = delegate
    }
    
    func fetchData() {
    
        var urlComponents = URLComponents(string: BaseAPI().something)
        let firstParam = URLQueryItem(name: "", value: "")
        let secondParam = URLQueryItem(name: "", value: "")
        urlComponents?.queryItems = [firstParam, secondParam]
        
        guard let url = urlComponents?.url else {
            delegate?.fail(message: ServiceError.unknown.message)
            return
        }
        
        Request().getRequest(urlRequest: URLRequest(url: url)) { response, error in
            
            if let erro = error {
                self.delegate?.fail(message: erro)
                return
            }
            
            guard let dataFromService = try? JSONDecoder().decode(HomeEntity.self, from: response!) else {
                self.delegate?.fail(message: ServiceError.parserError.message)
                return
            }
            self.delegate?.didFetchData(data: dataFromService)
        }
    }
}
