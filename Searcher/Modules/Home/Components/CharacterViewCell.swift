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
    var image = UIImage()
    var name = ""
}

class CharacterViewCell: UICollectionViewCell {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLbl: UILabel!

    var identifier = 0
    
    func fillCell(dto: CharacterDTO) {
        identifier = dto.id
        characterNameLbl.text = dto.name
        characterImage.image = dto.image
        
    }
    
    func setImage(with image: UIImage) {
        characterImage.image = image
    }
}
