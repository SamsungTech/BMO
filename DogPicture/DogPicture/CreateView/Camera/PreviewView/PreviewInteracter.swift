//
//  CaptureInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import Foundation

class PreviewInteracter: PreviewInteracterInputProtocol {
    weak var presenter: PreviewInteracterOutputProtocol?
    
}

extension PreviewInteracter: PreviewInteracterOutputProtocol {
    
}
