//
//  SideMenuRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/22.
//

import Foundation
import UIKit

class SideMenuRouter: SideMenuRouterProtocol {
    static func createSideMenuViewModule() -> UIViewController {
        let view: SideMenuViewProtocol = SideMenuViewController()
        if let sideMenuView = view as? UIViewController {
            let presenter: SideMenuPresenterProtocol & SideMenuInteractorOutputProtocol = SideMenuPresenter()
            let interactor: SideMenuInteractorInputProtocol & ModelDatabaseHelperOutputProtocol = SideMenuInteractor()
            let router: SideMenuRouterProtocol = SideMenuRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return sideMenuView
        }
        return UIViewController()
    }
    
    func dismissSideMenu(view: SideMenuViewProtocol) {
        if let sideMenuVIew = view as? UIViewController {
            sideMenuVIew.dismiss(animated: false, completion: nil)
        }
    }
}
