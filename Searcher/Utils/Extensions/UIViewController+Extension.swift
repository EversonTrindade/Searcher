//
//  Alert.swift
//  Searcher
//
//  Created by Everson Trindade on 06/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(message: String, completeBlock: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: completeBlock)
        alertController.addAction(action)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showLoader() {
        DispatchQueue.main.async {
            let loader = UIActivityIndicatorView(activityIndicatorStyle: .white)
            loader.center = UIApplication.shared.keyWindow?.center ?? CGPoint()
            loader.startAnimating()
            UIApplication.shared.keyWindow?.addSubview(loader)
        }
    }
    
    func dismissLoader() {
        DispatchQueue.main.async {
            if let loader = UIApplication.shared.keyWindow?.subviews.filter({ $0 is UIActivityIndicatorView }).first as? UIActivityIndicatorView {
                loader.removeFromSuperview()
            }
        }
    }
}