//
//  Costume.swift
//  AC-iOS-HalloweenTableViewCells
//
//  Created by C4Q  on 10/30/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct HalloweenImage {
    var imageName: String
    var tags: [String]
    init(imageName: String, tags: [String]) {
        self.imageName = imageName
        self.tags = tags
    }
}
