//
//  MenuRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit

class MenuRouter: MenuRouterProtocol {
    class func createMenuModule() -> UIViewController {
        if let view: MenuViewProtocol = MenuViewController() as? MenuViewProtocol {
            let presenter: MenuPresenterProtocol = MenuPresenter()
            let router: MenuRouterProtocol = MenuRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            
            if let MenuView = view as? UIViewController {
                return MenuView
            }
        }
        return UIViewController()
    }
}
