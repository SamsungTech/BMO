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
            let presenter: HomePresenterProtocol = HomePresenter()
            let interacter: HomeInteracterOutputProtocol = HomeInteracter() as! HomeInteracterOutputProtocol
            let router: HomeRouterProtocol = HomeViewRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interacter = interacter
            interacter.presenter = presenter
        }
        return UIViewController()
    }
    
    
    func presentMemoScreen(from view: HomeViewProtocol, forname name: String) {
        let MemoViewController = MemoViewRouter.createMemoViewRouter(from: name)
        if let memoView = view as? UIViewController {
            memoView.navigationController?.pushViewController(MemoViewController, animated: true)
        }
    }
}
