//
//  BaseAPI.swift
//  Searcher
//
//  Created by Everson Trindade on 01/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

struct BaseAPI {
    
    let apiKey = "c26ef96c66f9f17cfb02fe58269fe57b"
    let privKey = "161b1214631b0d5159f50f036b5d3d391279fd69"
    
    fileprivate let base = "https://gateway.marvel.com/v1/public/"
    
    var characters: String {
        return base + "characters"
    }
}

protocol Requestable: class {
    func getRequest(urlRequest: URLRequest?, completion: @escaping (_ result: Data?, _ error: String?) -> Void)
}
