//
//  ValidateManager.swift
//  Searcher
//
//  Created by Everson Trindade on 06/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

enum ServiceError {
    case unknown
    case noInternet
    case noData
    case parserError
    
    var message: String {
        switch self {
        case .unknown:
            return "Unknown error, try again"
        case .noInternet:
            return "Check your internet connection"
        case .noData:
            return "No data from server" //Improve
        case .parserError:
            return "parserError" // Improve
        }
    }
}
