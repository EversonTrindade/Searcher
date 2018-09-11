//
//  FavoriteManager.swift
//  Searcher
//
//  Created by Everson Trindade on 22/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation
import CoreData

class FavoriteManager {
    
    class func save(favoriteCharacter: Character) {
        let dataBase = LocalDataBase()
        let managedContext = dataBase.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteCharacter", in: managedContext)!
        let character = NSManagedObject(entity: entity, insertInto: managedContext)
        
        character.setValue(favoriteCharacter.id, forKey: "id")
        character.setValue(favoriteCharacter.name, forKey: "name")
        character.setValue(favoriteCharacter.thumbnail?.path, forKey: "image_url")
//        character.setValue(favoriteCharacter.imageData, forKey: "image_data")

        do {
            try managedContext.save()
        } catch  {
            print("ErrorSaving")
        }
    }
    
    class func remove(character: Character) {
        let dataBase = LocalDataBase()
//        let managedContext = dataBase.persistentContainer.viewContext
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteGame")
//        if let results = try? managedContext.fetch(request) as? [FavoriteGame] {
//            let game = results?.filter { Int($0.id) == favorite.game?._id }.first
//            if let gameModel = game {
//                managedContext.delete(gameModel)
//                try? managedContext.save()
//            }
//        }
    }
    
    func loadCharacters() -> [Character] {
        let dataBase = LocalDataBase()
        let managedContext = dataBase.persistentContainer.viewContext
        var favorites = [Character]()

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteCharacter")
        if let results = try? managedContext.fetch(request) as? [FavoriteCharacter] {
            results?.forEach { favorites.append(setFavoriteCharacter(with: $0)) }
        }
        return favorites
    }
    
    func setFavoriteCharacter(with object: FavoriteCharacter) -> Character {
        var favorite = Character()
        favorite.id = Int(object.id)
        favorite.name = object.name ?? ""
//        favorite.imageData = object.image_data ?? Data()
        favorite.thumbnail?.path = object.name ?? ""
        return favorite
    }
}
