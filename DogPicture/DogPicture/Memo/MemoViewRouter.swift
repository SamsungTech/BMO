//
//  MemoViewRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class MemoViewRouter: MemoViewRouterProtocol {
    static func createMemoViewRouter(from post: String) -> UIViewController {
        let view: MemoViewProtocol = MemoViewController() as! MemoViewProtocol
        let presenter: MemoViewPresenterProtocol = MemoViewPresenter()
        let wireFrame: MemoViewRouterProtocol = MemoViewRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        
        return UIViewController()
    }
    
}
