//
//  HomeInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class CameraInteracter: CameraInteracterInputProtocol {
    weak var presenter: CameraInteracterOutputProtocol?
}

extension CameraInteracter: CameraInteracterOutputProtocol {
    
}
