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
    let privateKey = "161b1214631b0d5159f50f036b5d3d391279fd69"
    let base = "https://gateway.marvel.com/v1/public/"
    let timeStamp = Date.timeIntervalBetween1970AndReferenceDate
}

struct DefaultParams{
    func getQueryParams(offsetValue: String, limitValue: String) -> [URLQueryItem] {
        let offset = URLQueryItem(name: "offset", value: offsetValue)
        let ts = URLQueryItem(name: "ts", value:"\(BaseAPI().timeStamp)")
        let apiKey = URLQueryItem(name: "apikey", value: BaseAPI().apiKey)
        let hash = URLQueryItem(name: "hash", value: "\(BaseAPI().timeStamp)\(BaseAPI().privateKey)\(BaseAPI().apiKey)".md5)
        let order = URLQueryItem(name: "orderBy", value: "name")
        let limit = URLQueryItem(name: "limit", value: limitValue)
        return [apiKey, ts, hash, order, offset, limit]
    }
}

protocol Requestable: class {
    func request(callKind: MarvelKind, httpMethod: String, completion: @escaping (_ result: Data?, _ error: String?) -> Void)
}
