//
//  Image.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/26.
//

import UIKit

class Image {
    static let shared = Image()
    
    let petitImages = [ "p1", "p2", "p3", "p4", "p5",
                        "p6", "p7", "p8", "p9", "p10",
                        "p11", "p12", "p13", "p14", "p15",
                        "p16", "p17", "p18", "p19", "p20",
                        "p21", "p22", "p23", "p24", "p25",
                        "p26", "p27", "p28", "p29", "p30"]
    
    var imageList: [UIImage?] = [UIImage(named: "chu2")]
    
    func getChuImageList() -> [UIImage?] {
        return imageList
    }
}
