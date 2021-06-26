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
            let presenter: MemoViewPresenterProtocol = MemoViewPresenter()
            let wireFrame: MemoViewRouterProtocol = MemoViewRouter()
            print(name)
            view.presenter = presenter
            presenter.view = view
            presenter.name = name
            presenter.wireFrame = wireFrame
            if let MemoView = view as? UIViewController {
                return MemoView
            }
        }
        return UIViewController()
    }
    
}
