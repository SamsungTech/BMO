//
//  CameraRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class CameraRouter: CameraRouterProtocol {
    static func createCameraModule() -> UIViewController {
        if let view: CameraViewControllerProtocol = CameraViewController() as? CameraViewControllerProtocol {
            let presenter: CameraPresenterProtocol & CameraInteracterOutputProtocol = CameraPresenter()
            let interacter: CameraInteracterInputProtocol = CameraInteracter()
            let router: CameraRouterProtocol = CameraRouter()
            
            presenter.view = view
            view.presenter = presenter
            presenter.router = router
            presenter.interacter = interacter
            interacter.presenter = presenter
        }
    }
    
    
}
