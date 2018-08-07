//
//  BaseAPI.swift
//  Searcher
//
//  Created by Everson Trindade on 01/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

struct BaseAPI {
    fileprivate let base = ""
    
    var something: String {
        return base + ""
    }
}

protocol Requestable: class {
    func getRequest(urlRequest: URLRequest?, completion: @escaping (_ result: Data?, _ error: String?) -> Void)
}
