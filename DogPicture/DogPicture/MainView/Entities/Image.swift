//
//  Image.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/26.
//

import UIKit

class Image {
    static let shared = Image()
    var imageList: [UIImage?] = [UIImage(named: "chu2")]
    
    func getChuImageList() -> [UIImage?] {
        return imageList
    }
    
}

