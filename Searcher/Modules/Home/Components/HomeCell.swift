//
//  HomeCell.swift
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

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImg: UIImageView!
    @IBOutlet weak var characterNameLbl: UILabel!
    @IBOutlet weak var favoriteBtn: UIButton!
    
    var identifier = 0
    weak var delegate: HomeCellDelegate?
    
    func fillCell(dto: CharacterDTO) {
        identifier = dto.id
        characterNameLbl.text = dto.name
        characterImg.image = dto.image
    }
    
    func setImage(with image: UIImage) {
        characterImg.image = image
        favoriteBtn.setImage(UIImage(named: "favorite-set-icon"), for: .selected)
        favoriteBtn.setImage(UIImage(named: "favorite-notset-icon"), for: .normal)
    }
    
    private func prepareImageData() -> Data? {
        guard let image = characterImg.image, let imageData = UIImagePNGRepresentation(image) else {
            return nil
        }
        return imageData
    }
    
    private func setFavoriteImage(favorite: Bool) {
        if favorite {
            favoriteBtn.isSelected = true
        } else {
            favoriteBtn.isSelected = false
        }
    }
    
    
    // MARK: IBAction
    @IBAction func favoriteAction(_ sender: Any) {
        delegate?.didFavorite(with: identifier, shouldFavorite: !favoriteBtn.isSelected, imageData: prepareImageData())
        setFavoriteImage(favorite: !favoriteBtn.isSelected)
    }
}
