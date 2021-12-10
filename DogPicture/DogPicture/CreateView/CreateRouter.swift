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
    
    func presentCameraView(view: CreateViewControllerProtocol,
                           presentingView: UITabBarController) {
        let cameraView = CameraRouter.createCameraModule()
        let cameraViewNavigationView = UINavigationController(rootViewController: cameraView)
        
        cameraViewNavigationView.modalPresentationStyle = .fullScreen
        
        guard let createView = view as? UIViewController else { return }
        createView.dismiss(animated: false) {
            presentingView.present(cameraViewNavigationView, animated: true, completion: nil)
        }
    }
    
    func presentLibraryView(view: CreateViewControllerProtocol, presentingView: UITabBarController) {
        let multiPickView = MultiPickerRouter.createMultiPickerViewModule()
        let multiNavigationView = UINavigationController(rootViewController: multiPickView)
        
        multiNavigationView.modalPresentationStyle = .formSheet
        
        guard let createView = view as? UIViewController else { return }
        createView.dismiss(animated: false) {
            presentingView.present(multiNavigationView, animated: true, completion: nil)
        }
    }
    
    func presentDiraryView() {
        print("dd")

    }
    
    func dismissView(view: CreateViewControllerProtocol) {
        if let createView = view as? UIViewController {
            createView.dismiss(animated: false, completion: nil)
        }
    }
    
    
}
