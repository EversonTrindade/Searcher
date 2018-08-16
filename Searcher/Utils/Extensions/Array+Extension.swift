//
//  Array+Extension.swift
//  Searcher
//
//  Created by Everson Trindade on 16/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation

extension Array {
    func object(index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }
}
