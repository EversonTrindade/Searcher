//
//  DetailRouter.swift
//  Searcher
//
//  Created by Everson Trindade on 16/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

class DetailRouter {
    func createDetailModule() -> UIViewController {
        return UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController")
    }
}
