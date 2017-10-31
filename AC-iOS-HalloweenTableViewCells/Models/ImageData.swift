//
//  ImageData.swift
//  AC-iOS-HalloweenTableViewCells
//
//  Created by C4Q  on 10/30/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class ImageData {
    
    static var images: [HalloweenImage] = [
         HalloweenImage(imageName: "pumpkinHead",
                        tags: ["Costume", "Pumpkin", "Scarecrow"]),
         HalloweenImage(imageName: "pumpkin",
                        tags: ["Pumpkin", "Spooky"]),
         HalloweenImage(imageName: "pumpkinWeb",
                        tags: ["Pumpkin", "Spider"]),
         HalloweenImage(imageName: "spiderHouse",
                        tags: ["Spider", "Haunted House"]),
         HalloweenImage(imageName: "hauntedHouse",
                        tags: ["Pumpkin", "Haunted House"]),
         HalloweenImage(imageName: "witchCat",
                        tags: ["Witch", "Cat", "Broom"]),
        HalloweenImage(imageName: "witchForest",
                       tags: ["Witch", "Moon", "Forest"]),
        HalloweenImage(imageName: "catInPumpkin",
                       tags: ["Cat", "Pumpkin", "Witch", "Spider"])
    ]
    
    static var imagesWithGhost: [HalloweenImage] = ImageData.images
    static var filteredImages: [HalloweenImage] = []
    
    static var allTags: [String] {
        var myTags: [String] = []
        for image in images {
            myTags += image.tags
        }
        return Array(Set(myTags)).sorted()
    }
    
    static func filterImages(with sectionName: String) {
     ImageData.filteredImages = ImageData.imagesWithGhost.filter{$0.tags.contains(sectionName)}
    }
    
    static func injectGhost() {
        imagesWithGhost = images
        let listCount = ImageData.images.count
        let randomIndex = Int(arc4random_uniform(UInt32(listCount)))
        ImageData.imagesWithGhost[randomIndex].imageName = "ghost"
    }
}
