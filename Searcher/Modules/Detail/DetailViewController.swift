//
//  DetailView.swift
//  Searcher
//
//  Created by Everson Trindade on 09/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fill(characterDTO: CharacterDTO) {
        print(characterDTO)
        navigationItem.title = characterDTO.name
    }
}
