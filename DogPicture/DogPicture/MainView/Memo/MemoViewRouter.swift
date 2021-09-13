//
//  MemoViewRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class MemoViewRouter: MemoViewRouterProtocol {
    
    static func createMemoViewRouter(from name: String) -> UIViewController {
        if let view: MemoViewProtocol = MemoViewController() as? MemoViewProtocol {
            let presenter: MemoViewPresenterProtocol & MemoViewInteracterOutputProtocol = MemoViewPresenter()
            let router: MemoViewRouterProtocol = MemoViewRouter()
            let interacter: MemoViewInteracterInputProtocol = MemoViewInteracter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.name = name
            presenter.router = router
            presenter.interacter = interacter
            interacter.presenter = presenter
            
            if let MemoView = view as? UIViewController {
                return MemoView
            }
        }
        return UIViewController()
    }
    func dismissHomeViewController(from view: HomeViewProtocol) {
        if let memoView = view as? UIViewController {
            memoView.dismiss(animated: true, completion: nil)
        }
    }
}
