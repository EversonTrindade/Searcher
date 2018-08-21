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
            let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
            effectView.frame = CGRect.init(x: 0, y: 0, width: 70, height: 70)
            effectView.center = UIApplication.shared.keyWindow?.center ?? CGPoint()
            effectView.layer.cornerRadius = 8
            effectView.clipsToBounds = true
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
            activityIndicator.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
            activityIndicator.startAnimating()
            effectView.contentView.addSubview(activityIndicator)
            activityIndicator.center = effectView.contentView.center
            UIApplication.shared.keyWindow?.addSubview(effectView)
        }
    }
    
    func dismissLoader() {
        DispatchQueue.main.async {
            if let loader = UIApplication.shared.keyWindow?.subviews.filter({ $0 is UIVisualEffectView }).first as? UIVisualEffectView {
                loader.removeFromSuperview()
            }
        }
    }
}
