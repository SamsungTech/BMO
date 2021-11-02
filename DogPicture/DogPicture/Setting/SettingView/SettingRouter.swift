//
//  SettingRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

class SettingRouter: SettingRouterProtocol {
    static func createSettingModule() -> UIViewController {
        let view: SettingViewProtocol = SettingViewController() 
        let presenter: SettingPresenterProtocol & SettingInteracterOutputProtocol = SettingPresenter()
        let interacter: SettingInteracterInputProtocol & SettingDataManagerOutputProtocol = SettingInteracter()
        let dataManager: SettingDataManagerInputProtocol = DogInfoDatabaseHelper()
        let router: SettingRouterProtocol = SettingRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interacter = interacter
        interacter.presenter = presenter
        interacter.dataManager = dataManager
        
        if let settingView = view as? UIViewController {
            return settingView
        }
        return UIViewController()
    }
    func presentLocalPushView(from view: SettingViewProtocol) {
        let localPushViewController = LocalPushRouter.createLocalPushModule()
        
        if let view = view as? UIViewController {
            view.modalPresentationStyle = .fullScreen
            view.present(localPushViewController, animated: true, completion: nil)
        }
    }
}
