//
//  HomeViewWireFrame.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class HomeViewRouter: HomeRouterProtocol {
    
    class func createHomeModule() -> UIViewController {
        let view: HomeViewProtocol = HomeViewController() as! HomeViewProtocol
        let presenter: HomePresenterProtocol = HomePresenter()
        let interacter: HomeInteracter = HomeInteracter()
        let router: HomeRouterProtocol = HomeViewRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interacter = interacter
        interacter.presenter = presenter
        
        return UIViewController()
    }
    
    
    func presentMemoScreen(from view: HomeViewProtocol, forname name: String) {
        let MemoViewController = MemoViewRouter.createMemoViewRouter(from: <#String#>)
    }
}
