//
//  TextEditRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/03.
//

import Foundation
import UIKit

class TextEditRouter: TextEditRouterProtocol {
    static func createTextEditViewModule() -> UIViewController {
        let view: TextEditViewControllerProtocol = TextEditViewController()
        if let textEidtView = view as? UIViewController {
            let presenter: TextEditPresenterProtocol & TextEditInteractorOutputProtocol = TextEditPresenter()
            let interactor: TextEditInteractorInputProtocol = TextEditInteractor()
            let router: TextEditRouterProtocol = TextEditRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return textEidtView
        }
        return UIViewController()
    }
}
