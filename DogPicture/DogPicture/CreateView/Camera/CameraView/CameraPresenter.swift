//
//  CameraPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import Foundation

class CameraPresenter: CameraPresenterProtocol {
    weak var view: CameraViewProtocol?
    var interacter: CameraInteracterInputProtocol?
    var router: CameraRouterProtocol?

    func showCamera() {
        print("x")
    }
    
    func dismissButtonCilked() {
        guard let view = view else { return }
        router?.dismissCameraView(view: view)
    }
    func nextButtonCilcked(imageData: [Data]) {
        guard let view = view else { return }
        router?.pushPreview(from: view, data: imageData)
    }
}

extension CameraPresenter: CameraInteracterOutputProtocol {
    
}
