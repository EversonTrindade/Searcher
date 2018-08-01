//
//  HomeInterector.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class HomeInteractor: HomePresenterToInteractorProtocol {
    
    weak var interector: HomeInteractorToPresenterProtocol?
    
    func fetchData() {
        let url = URL(string: BaseAPI().something)
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataFromService = data else {
                return
            }
            
            guard let sevice = try? JSONDecoder().decode(HomeEntity.self, from: dataFromService) else {
                self.interector?.failFetchData()
                return
            }
            
            self.interector?.didFetchData(data: sevice)
        }
    }
}
