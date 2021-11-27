//
//  CaptureRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import UIKit

class PreviewRouter: PreviewRouterProtocol {
    static func createPreviewModule(forImage data: Data) -> UIViewController {
        let view: PreviewViewProtocol = PreviewViewController()
        let presenter: PreviewPresenterProtocol & PreviewInteracterOutputProtocol = PreviewPresenter()
        let interacter: PreviewInteracterInputProtocol = PreviewInteracter()
        let router: PreviewRouterProtocol = PreviewRouter()
        
        presenter.view = view
        view.presenter = presenter
        presenter.router = router
        presenter.data = data
        presenter.interacter = interacter
        interacter.presenter = presenter
        
        if let previewView = view as? UIViewController {
            return previewView
        }
        return UIViewController()
    }
    
    func presentHomeScreen(from view: PreviewViewProtocol) {
        let homeView = HomeViewRouter.createHomeModule()
        if let view = view as? UIViewController {
            view.present(homeView, animated: false, completion: nil)
        }
    }
}
