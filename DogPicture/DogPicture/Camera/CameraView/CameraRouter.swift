//
//  CameraRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class CameraRouter: CameraRouterProtocol {
    static func createCameraModule() -> UIViewController {
        let view: CameraViewProtocol = CameraViewController()
        let presenter: CameraPresenterProtocol & CameraInteracterOutputProtocol = CameraPresenter()
        let interacter: CameraInteracterInputProtocol = CameraInteracter()
        let router: CameraRouterProtocol = CameraRouter()
        
        presenter.view = view
        view.presenter = presenter
        presenter.router = router
        presenter.interacter = interacter
        interacter.presenter = presenter
        
        if let cameraView = view as? UIViewController {
            return cameraView
        }
        return UIViewController()
    }
    
    func presentPreview(from view: CameraViewProtocol, data: Data) {
        let previewViewController = PreviewRouter.createPreviewModule(forImage: data)
        if let preview = view as? UIViewController {
            preview.modalPresentationStyle = .fullScreen
            preview.present(previewViewController, animated: true, completion: nil)
        }
    }
    
}
