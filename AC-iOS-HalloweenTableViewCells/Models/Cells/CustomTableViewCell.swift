//
//  CustomTableViewCell.swift
//  AC-iOS-HalloweenTableViewCells
//
//  Created by Masai Young on 10/31/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with image: HalloweenImage) {
        topImageView.image = UIImage(named: image.imageName)
        topImageLabel.text = image.imageName
    }
}

