//
//  CameraPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class CameraPresenter: CameraPresenterProtocol {
    
    weak var view: CameraViewProtocol?
    var interacter: CameraInteracterInputProtocol?
    var router: CameraRouterProtocol?

    func showCamera() {
        print("x")
    }
    
    func showPreview(imageData: Data) {
        guard let view = view else { return }
        router?.presentPreview(from: view, data: imageData)
    }
}

extension CameraPresenter: CameraInteracterOutputProtocol {
    
}
