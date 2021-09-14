//
//  CaptureRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import UIKit

class PreviewRouter: PreviewRouterProtocol {
    static func createPreviewModule() -> UIViewController {
        if let view: PreviewViewProtocol = PreviewViewController() as? PreviewViewProtocol {
            let presenter: PreviewPresenterProtocol & PreviewInteracterOutputProtocol = PreviewPresenter()
            let interacter: PreviewInteracterInputProtocol = PreviewInteracter()
            let router: PreviewRouterProtocol = PreviewRouter()
            
            presenter.view = view
            view.presenter = presenter
            presenter.router = router
            presenter.interacter = interacter
            interacter.presenter = presenter
            
            if let previewView = view as? UIViewController {
                return previewView
            }
            
        }
        return UIViewController()
    }
}
