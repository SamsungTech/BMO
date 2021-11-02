//
//  LocalPushRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/06.
//

import Foundation
import UIKit

class LocalPushRouter: LocalPushRouterProtocol {
    static func createLocalPushModule() -> UIViewController {
        let view: LocalPushViewProtocol = LocalPushViewController()
        let presenter: LocalPushPresenterProtocol & LocalPushInteracterOutputProtocol = LocalPushPresenter()
        let interacter: LocalPushInteracterInputProtocol = LocalPushInteracter()
        let router: LocalPushRouterProtocol = LocalPushRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interacter = interacter
        interacter.presenter = presenter
        
        if let pushView = view as? UIViewController {
            return pushView
        }
        
        return UIViewController()
    }
    func dismissLocalPushView(from view: LocalPushViewProtocol) {
        if let pushView = view as? UIViewController {
            pushView.dismiss(animated: true, completion: nil)
        }
        
    }
}
