
//  Request.swift
//  Searcher
//
//  Created by Everson Trindade on 06/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class Request: Requestable {
    
    var limit: Int?
    var offset: Int?
    
    init(limit: Int, offset: Int) {
        self.limit = limit
        self.offset = offset
    }
    
    func request(callKind: MarvelKind, httpMethod: String, completion: @escaping (Data?, String?) -> Void) {
        var urlComponents = URLComponents(string: "\(BaseAPI().base)\(callKind)")
        urlComponents?.queryItems = DefaultParams().getQueryParams(offsetValue: "\(offset ?? 0)", limitValue: "\(limit ?? 0)")
        guard let url = urlComponents?.url else {
            completion(nil, ServiceError.url.message)
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.url = url
//        urlRequest.url = URL(string: "https://api.myjson.com/bins/10bjv0")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = httpMethod

        URLSession.shared.dataTask(with: urlRequest) { data, response, error  in
            if let _ = error {
                completion(nil, ServiceError.unknown.message)
                return
            }
            guard let _ = data else {
                completion(nil, ServiceError.noData.message)
                return
            }

            completion(data, nil)
        }.resume()
    }
}
