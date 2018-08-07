//
//  Request.swift
//  Searcher
//
//  Created by Everson Trindade on 06/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

class Request: Requestable {
    
    func getRequest(urlRequest: URLRequest?, completion: @escaping (_ result: Data?, _ error: String?) -> Void) {
        
        var urlRequest = urlRequest
        urlRequest?.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let request = urlRequest else {
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error  in
            if let error = error {
                completion(nil, error.localizedDescription)
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
