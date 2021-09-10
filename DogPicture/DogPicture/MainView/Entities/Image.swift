//
//  Image.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/26.
//

import UIKit

class Image {
    static let shared = Image()
    var petitImages: [String] = [ "p1", "p2", "p3", "p4", "p5" ]
    func getDogImageList() -> [String] {
        return petitImages
    }
}
