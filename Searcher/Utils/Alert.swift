//
//  Alert.swift
//  Searcher
//
//  Created by Everson Trindade on 06/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    static func showAlert(message: String) -> UIAlertController{
        let alert = UIAlertController(title: "Alert" , message: (message), preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        return alert
    }
}
