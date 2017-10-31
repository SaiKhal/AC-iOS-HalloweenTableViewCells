//
//  BottomImageCell.swift
//  AC-iOS-HalloweenTableViewCells
//
//  Created by Masai Young on 10/31/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class BottomImageCell: UITableViewCell {

    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with image: HalloweenImage) {
        bottomLabel.text = image.imageName
        bottomImageView.image = UIImage(named: image.imageName)
    }
}
