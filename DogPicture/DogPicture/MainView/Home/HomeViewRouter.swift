//
//  HomeViewWireFrame.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class HomeViewRouter: HomeRouterProtocol {
    class func createHomeModule() -> UIViewController {
        if let view: HomeViewProtocol = HomeViewController() as? HomeViewProtocol {
            let presenter: HomePresenterProtocol & HomeInteracterOutputProtocol = HomePresenter()
            let interacter: HomeInteracterInputProtocol = HomeInteracter()
            let router: HomeRouterProtocol = HomeViewRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interacter = interacter
            interacter.presenter = presenter
            
            if let HomeView = view as? UIViewController {
                return HomeView
            }
        }
        return UIViewController()
    }
    
    func presentMemoScreen(from view: HomeViewProtocol, forname name: Model) {
        let MemoViewController = MemoViewRouter.createMemoViewRouter(from: name)
        if let memoView = view as? UIViewController {
            MemoViewController.modalPresentationStyle = .fullScreen
            memoView.present(MemoViewController, animated: true)
        }
    }
}
