//
//  CameraPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class CameraPresenter: CameraPresenterProtocol {
    weak var view: CameraViewControllerProtocol?
    var interacter: CameraInteracterInputProtocol?
    var router: CameraRouterProtocol?

    func showCamera() {
        <#code#>
    }
    
    
}

extension CameraPresenter: CameraInteracterOutputProtocol {
    
}
