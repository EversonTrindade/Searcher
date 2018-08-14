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
    var characters = [Character]()
    
    init(_ delegate: HomeInteractorToPresenterProtocol?) {
        self.delegate = delegate
    }
    
    func fetchData() {
    
        var urlComponents = URLComponents(string: BaseAPI().characters)
        let apiKey = URLQueryItem(name: "apikey", value: BaseAPI().apiKey)
        let timeStamp = URLQueryItem(name: "ts", value:"\(Date().timeIntervalSince1970 * 1000)")
        let hash = URLQueryItem(name: "hash", value: "\(timeStamp)\(BaseAPI().privKey)\(BaseAPI().apiKey)".MD5)
        urlComponents?.queryItems = [apiKey, timeStamp, hash]
        
        guard let url = urlComponents?.url else {
            delegate?.fail(message: ServiceError.unknown.message)
            return
        }
        
        let testUrl = URL(string: "https://api.myjson.com/bins/10bjv0")
        
        Request().getRequest(urlRequest: URLRequest(url: testUrl!)) { response, error in
            
            if let erro = error {
                self.delegate?.fail(message: erro)
                return
            }
            
            guard let dataFromService = try? JSONDecoder().decode(HomeEntity.self, from: response!) else {
                self.delegate?.fail(message: ServiceError.parserError.message)
                return
            }
            self.characters = dataFromService.data.results
            self.delegate?.didFetchData()
        }
    }
}
