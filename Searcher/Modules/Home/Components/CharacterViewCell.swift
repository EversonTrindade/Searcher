//
//  CharacterViewCell.swift
//  Searcher
//
//  Created by Everson Trindade on 14/08/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

struct CharacterDTO {
    var id = 0
    var image = ""
    var name = ""
//    var imageFile
}

class CharacterViewCell: UICollectionViewCell {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLbl: UILabel!
    
    func fillCell(dto: CharacterDTO) {
        characterNameLbl.text = dto.name
    }
    
}
