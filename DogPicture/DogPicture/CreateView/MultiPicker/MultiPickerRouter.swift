//
//  MultiPickerRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/08.
//

import Foundation
import UIKit

class MultiPickerRouter: MultiPickerRouterProtocol {
    static func createMultiPickerViewModule() -> UIViewController {
        let view: MultiPickerViewControllerProtocol = MultiPickerViewController()
        if let multiPickerView = view as? UIViewController {
            let presenter: MultiPickerPresenterProtocol & MultiPickerInteractorOutputProtocol = MultiPickerPresenter()
            let interactor: MultiPickerInteractorInputProtocol = MultiPickerInteractor()
            let router: MultiPickerRouterProtocol = MultiPickerRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return multiPickerView
        }
        return UIViewController()
    }
}
