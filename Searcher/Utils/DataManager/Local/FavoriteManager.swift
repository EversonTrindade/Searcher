//
//  FavoriteManager.swift
//  Searcher
//
//  Created by Everson Trindade on 22/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation
import CoreData

fileprivate struct Database {
    static let favorite = "FavoriteCharacter"
}

class FavoriteManager {
    
    let managedContext = LocalDataBase().persistentContainer.viewContext
    
    func save(favoriteCharacter: Character) {
        if let entity = NSEntityDescription.entity(forEntityName: Database.favorite, in: managedContext) {
            let character = NSManagedObject(entity: entity, insertInto: managedContext)
            character.setValue(favoriteCharacter.id, forKey: "id")
            character.setValue(favoriteCharacter.name, forKey: "name")
            character.setValue(favoriteCharacter.thumbnail?.file, forKey: "image_url")
            character.setValue(favoriteCharacter.imageData, forKey: "image_data")
            do {
                try managedContext.save()
            } catch  {
                print("ErrorSaving")
            }
        }
    }
    
    func remove(character: Character) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Database.favorite)
        if let results = try? managedContext.fetch(request) as? [FavoriteCharacter] {
            let character = results?.filter { Int($0.id) == character.id }.first
            if let characterModel = character {
                managedContext.delete(characterModel)
                try? managedContext.save()
            }
        }
    }
    
    func loadCharacters() -> [Character] {
        var favorites = [Character]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Database.favorite)
        if let results = try? managedContext.fetch(request) as? [FavoriteCharacter] {
            results?.forEach { favorites.append(setFavoriteCharacter(with: $0)) }
        }
        return favorites
    }
    
    func setFavoriteCharacter(with object: FavoriteCharacter) -> Character {
        var favorite = Character()
        favorite.id = Int(object.id)
        favorite.name = object.name ?? ""
        favorite.imageData = object.image_data ?? Data()
//        favorite.thumbnail?.file = object.name ?? ""
        return favorite
    }
}
