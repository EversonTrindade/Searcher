//
//  HomeEntity.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

struct HomeEntity: Decodable {
    var data: CharactersData
}

struct CharactersData: Decodable {
    var total: Int
    var results: [Character]
}

struct Character: Decodable {
    var id: Int?
    var name: String?
    var thumbnail: Thumbnail?
    var imageData: Data?
    
    init() { }
}

struct Thumbnail: Decodable {
    var path: String?
    var pathExtension: String?
    var file: String {
        return "\(path ?? "").\(pathExtension ?? "")"
    }
    
    init() { }
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case pathExtension = "extension"
    }
}
