//
//  MainRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol {
    static func createMainModule() -> UIViewController {
        let view: MainViewProtocol = MainViewController()
        let presenter: MainPresenterProtocol & MainInteracterOutputProtocol = MainPresenter()
        let interacter: MainInteracterInputProtocol = MainInteracter()
        let router: MainRouterProtocol = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interacter = interacter
        interacter.presenter = presenter
        
        if let mainView = view as? UIViewController {
            return mainView
        }
        
        return UIViewController()
    }
}
