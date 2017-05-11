//
//  ImageDataStorage.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 12.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

class ImageDataStorage {
    var allImageData = [ImageData]()
    
    let imageDataURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("imageData.archive")
    }()
    
    func newImageData() -> ImageData {
        let newImageData = ImageData(title: "", photograph: "", dateTaken: nil, size: CGSize.zero)
        allImageData.append(newImageData)
        
        return newImageData
    }
    
    func removeImageData(_ imageData: ImageData) {
        if let toRemove = allImageData.index(where: { $0.title == imageData.title }) {
            allImageData.remove(at: toRemove)
        }
    }
    
    func saveChanges() -> Bool {
        return NSKeyedArchiver.archiveRootObject(allImageData, toFile: imageDataURL.path)
    }
    
    init() {
        if let storedImageData = NSKeyedUnarchiver.unarchiveObject(withFile: imageDataURL.path) as? [ImageData] {
            allImageData = storedImageData
        }
    }
}
