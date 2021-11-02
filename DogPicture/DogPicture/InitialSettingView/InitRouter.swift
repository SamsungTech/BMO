//
//  InitRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/02.
//

import Foundation
import UIKit

class InitRouter: InitRouterProtocol {
    static func createInitModule() -> UIViewController {
        let view: InitViewControllerProtocol = InitViewController()
        let presenter: InitPresenterProtocol & InitInteracterOutputProtocol = InitPresenter()
        let interacter: InitInteracterInputProtocol = InitInteracter()
        let router: InitRouterProtocol = InitRouter()
        
        presenter.view = view
        view.presenter = presenter
        presenter.router = router
        presenter.interacter = interacter
        interacter.presenter = presenter
        
        if let view = view as? InitViewController {
            return view
        }
        return UIViewController()
    }
}
