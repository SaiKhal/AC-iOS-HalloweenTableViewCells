//
//  ViewController.swift
//  AC-iOS-HalloweenTableViewCells
//
//  Created by C4Q  on 10/30/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var HalloweenTableView: UITableView!
    var delegate: UITableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.HalloweenTableView.delegate = self
        self.HalloweenTableView.dataSource = self
        self.HalloweenTableView.rowHeight = UITableViewAutomaticDimension
        self.HalloweenTableView.estimatedRowHeight = 200.0
        ImageData.injectGhost()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

// MARK: - UIDataSource Methods
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ImageData.images.filter{$0.tags.contains(ImageData.allTags[section])}.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configures and returns the cells to the table view
        let rowNumber = indexPath.row
        ImageData.filterImages(with: ImageData.allTags[indexPath.section])
        
        if rowNumber % 2 == 0 {
            let topCell = tableView.dequeueReusableCell(withIdentifier: "TopImageCell", for: indexPath)
            return configure(cell: topCell, at: rowNumber)
        } else {
            let bottomCell = tableView.dequeueReusableCell(withIdentifier: "BottomImageCell", for: indexPath)
            return configure(cell: bottomCell, at: rowNumber)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ImageData.allTags.count
    }
    
    func configure(cell: UITableViewCell, at rowNumber: Int) -> UITableViewCell {
        let image = ImageData.filteredImages[rowNumber]
        if let imageCell = cell as? TopImageCell {
            imageCell.configureCell(with: image)
        } else if let imageBottomCell = cell as? BottomImageCell {
            imageBottomCell.configureCell(with: image)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? TopImageCell {
            if cell.topLabel.text == "ghost" {
                dump(ImageData.imagesWithGhost)
                ImageData.injectGhost()
                tableView.reloadData()
            }
        } else if let cell = tableView.cellForRow(at: indexPath) as? BottomImageCell {
            if cell.bottomLabel.text == "ghost" {
                dump(ImageData.imagesWithGhost)
                ImageData.injectGhost()
                tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Broom"
        case 1:
            return "Cat"
        case 2:
            return "Costume"
        case 3:
            return "Forest"
        case 4:
            return "Haunted House"
        case 5:
            return "Moon"
        case 6:
            return "Pumpkin"
        case 7:
            return "Scarecrow"
        case 8:
            return "Spider"
        case 9:
            return "Spokey"
        case 10:
            return "Witch"
        default:
            return "Error found!"
        }
    }
}
