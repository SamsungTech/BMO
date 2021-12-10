//
//  LocalImageManager.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/10.
//

import Foundation
import Photos
import UIKit

class LocalImageManager {
    static var shared = LocalImageManager()
    
    var imageManager = PHCachingImageManager()
    
    var representAssetIdentifier: String = ""
    
    func requestImage(with asset: PHAsset?,
                              thumbnailSize: CGSize,
                              completion: @escaping (UIImage?) -> Void) {
        guard let asset = asset else {
            completion(nil)
            return
        }
        
        let fetchOption = PHFetchOptions()

        fetchOption.fetchLimit = 1
        fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]

        let fetchPhotos = PHAsset.fetchAssets(with: fetchOption)
        
        self.representAssetIdentifier = asset.localIdentifier
        self.imageManager.requestImage(for: asset,
                                          targetSize: thumbnailSize,
                                          contentMode: .aspectFill,
                                          options: nil,
                                          resultHandler: { image, _ in
            if self.representAssetIdentifier == asset.localIdentifier {
                completion(image)
            }
        })
    }
}
