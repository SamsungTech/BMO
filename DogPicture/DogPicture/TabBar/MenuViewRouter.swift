//
//  MenuRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit

class MenuViewRouter: MenuViewRouterProtocol {
    class func createMenuModule() -> UIViewController {
        if let view: MenuViewProtocol = MenuViewController() as? MenuViewProtocol {
            let presenter: MenuViewPresenterProtocol & MenuViewInteracterOutputProtocol = MenuViewPresenter()
            let interacter: MenuViewInteracterInputProtocol = MenuViewInteracter()
            let router: MenuViewRouterProtocol = MenuViewRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            interacter.presenter = presenter
            
            if let MenuView = view as? UIViewController {
                return MenuView
            }
        }
        return UIViewController()
    }
}
