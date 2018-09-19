//
//  HomeInterector.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation
import UIKit

class HomeInteractor: HomePresenterToInteractorProtocol {

    private weak var delegate: HomeInteractorToPresenterProtocol?
    var characters = [Character]()
    private let limit = 20
    private var cache = NSCache<NSString, UIImage>()
    private var favorites = [Character]()

    init(_ delegate: HomeInteractorToPresenterProtocol?) {
        self.delegate = delegate
    }
}

// MARK: - FetchData
extension HomeInteractor {
    
    func fetchData(offset: Int) {
        Request(limit: limit, offset: offset * limit).request(callKind: MarvelKind.characters, httpMethod: HTTP.get.method) { response, error in
            if let erro = error {
                self.delegate?.fail(message: erro)
                return
            }
            
            guard let dataFromService = try? JSONDecoder().decode(HomeEntity.self, from: response ?? Data()) else {
                self.delegate?.fail(message: ServiceError.parserError.message)
                return
            }
            self.characters.append(contentsOf: dataFromService.data.results)
            self.getFavorites()
            self.delegate?.didFetchData()
        }
    }
}

// MARK: - Image Cache
extension HomeInteractor {
    
    func getImageFrom(url: String, identifier: Int) -> UIImage {
        
        if let imageCached = cache.object(forKey: NSString(string: "\(identifier)")) {
            return imageCached
        }
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    if let imageToCache = UIImage(data: data) {
                        self.cache.setObject(imageToCache, forKey: NSString(string: "\(identifier)"))
                        self.delegate?.didLoadImage(identifier: identifier)
                    }
                }
                }.resume()
        }
        return UIImage()
    }
    
    func getImageFromCache(with identifier: Int) -> UIImage {
        if let imageCached = cache.object(forKey: NSString(string: "\(identifier)")) {
            return imageCached
        }
        return UIImage()
    }
}

// MARK: - Favorite
extension HomeInteractor {

    func getFavorites() {
        favorites = FavoriteManager().loadCharacters()
    }
    
    func isFavorite(id: Int) -> Bool {
        return favorites.filter { $0.id == id }.count > 0
    }
    
    func didFavorite(with id: Int, shouldFavorite: Bool, imageData: Data?) {
        let array = characters.filter{ id == $0.id }
        guard let character = array.first else {
            return
        }

        var favorite = character
        favorite.imageData = imageData ?? Data().base64EncodedData()
        
        if shouldFavorite {
            FavoriteManager().save(favoriteCharacter: favorite)
        } else {
            FavoriteManager().remove(character: favorite)
        }
    }
}
