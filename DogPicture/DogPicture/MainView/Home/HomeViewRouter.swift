//
//  HomeViewWireFrame.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class HomeViewRouter: HomeRouterProtocol {
    class func createHomeModule() -> UIViewController {
        let view: HomeViewProtocol = HomeViewController()
        let presenter: HomePresenterProtocol & HomeInteracterOutputProtocol = HomePresenter()
        let interacter: HomeInteracterInputProtocol = HomeInteracter()
        let router: HomeRouterProtocol = HomeViewRouter()
        let localDataManager: ModelDatabaseHelperInputProtocol = ModelDatabaseHelper()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interacter = interacter
        interacter.presenter = presenter
        interacter.localDataManager = localDataManager
        
        if let HomeView = view as? UIViewController {
            return HomeView
        }
        return UIViewController()
    }
    
    func presentMemoScreen(from view: HomeViewProtocol, forname name: Model, index: IndexPath) {
        let MemoViewController = MemoViewRouter.createMemoViewRouter(from: name)
        
        if let memoView = view as? UIViewController {
            MemoViewController.modalPresentationStyle = .formSheet
            memoView.present(MemoViewController, animated: true)
        }
    }
    func presentSideMenu(from view: HomeViewProtocol) {
        let sideMenuView = SideMenuRouter.createSideMenuViewModule()
        
        if let sideView = view as? UIViewController {
            sideMenuView.modalPresentationStyle = .overFullScreen
            sideView.present(sideMenuView, animated: false)
        }
    }
}
