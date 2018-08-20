//
//  Manager.swift
//  Searcher
//
//  Created by Everson Trindade on 19/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

enum HTTP {
    case get
    case post
    case put
    
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        }
    }
}

enum MarvelKind {
    case characters
    case comics
    case creators
    case events
    case series
    case stories
}
