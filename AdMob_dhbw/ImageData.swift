//
//  ImageData.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 12.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

class ImageData {
    var title: String
    var photograph: String
    var dateTaken: Date?
    var size: CGSize
    
    init(title: String, photograph: String, dateTaken: Date?, size: CGSize) {
        self.title = title
        self.photograph = photograph
        self.dateTaken = dateTaken
        self.size = size
    }
}
