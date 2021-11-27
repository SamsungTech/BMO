//
//  CreateRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/27.
//

import Foundation
import UIKit

class CreateRouter: CreateRouterProtocol {
    static func createCreateViewModule() -> UIViewController {
        let view: CreateViewControllerProtocol = CreateViewController()
        if let createView = view as? UIViewController {
            let presenter: CreatePresenterProtocol & CreateInteractorOutputProtocol = CreatePresenter()
            let interactor: CreateInteractorInputProtocol = CreateInteractor()
            let router: CreateRouterProtocol = CreateRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return createView
        }
        
        return UIViewController()
    }
    
    func presentCameraView(presentingView: UITabBarController) {
        let cameraView = CameraRouter.createCameraModule()
        
        cameraView.modalPresentationStyle = .fullScreen
        presentingView.present(cameraView, animated: true, completion: nil)
    }
    
    func presentLibraryView() {
        print("dd")
    }
    
    func presentDiraryView() {
        print("dd")

    }
    
    
    
    
}
