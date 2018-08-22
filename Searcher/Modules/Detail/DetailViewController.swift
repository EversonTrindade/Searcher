//
//  DetailView.swift
//  Searcher
//
//  Created by Everson Trindade on 09/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var characterImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fill(dto: CharacterDTO) {
        navigationItem.title = dto.name
    }
}
