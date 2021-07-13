//
//  CameraPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class CameraPresenter: CameraPresenterProtocol {
    func showCamera() {
        <#code#>
    }
    
    weak var view: CameraViewControllerProtocol?
    var interacter: CameraInteracterInputProtocol?
    var router: CameraRouterProtocol?

    
    
    
}

extension CameraPresenter: CameraInteracterOutputProtocol {
    
}
