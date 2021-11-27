//
//  CollectionRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation
import UIKit

class CollectionRouter: CollectionRouterProtocol {
    static func createCollectionModule() -> UIViewController {
        let view: CollectionViewProtocol = CollectionViewController()
        let presenter: CollectionPresenterProtocol & CollectionInteracterOutputProtocol = CollectionPresenter()
        let interacter: CollectionInteracterInputProtocol = CollectionInteracter()
        let router: CollectionRouterProtocol = CollectionRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interacter = interacter
        interacter.presenter = presenter
        
        if let collectionView = view as? UIViewController {
            return collectionView
        }
        return UIViewController()
    }
}
