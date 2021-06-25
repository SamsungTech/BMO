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
            // HomePresenterProtocol == 흰티 입은애
            let presenter: HomePresenterProtocol & HomeInteracterOutputProtocol = HomePresenter()
            let interacter: HomeInteracterInputProtocol = HomeInteracter()
            let router: HomeRouterProtocol = HomeViewRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interacter = interacter
            interacter.presenter = presenter
            
            if let castedView = view as? UIViewController {
                return castedView
            }
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
