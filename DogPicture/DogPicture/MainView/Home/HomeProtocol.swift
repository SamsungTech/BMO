//
//  HomeViewProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    
    func showModels(with data: [Model])
    func refershCalender(tag: Int)
}

protocol HomeRouterProtocol: AnyObject {
    static func createHomeModule() -> UIViewController
    
    func presentMemoScreen(from view: HomeViewProtocol, forname name: Model, index: IndexPath)
    func presentSideMenu(from view: HomeViewProtocol)
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interacter: HomeInteracterInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func viewDidLoad()
    func showMemo(for name: Model, index: IndexPath)
    func sideMenuButtonClicked()
    func calenderDidTap(tag: Int)
}

protocol HomeInteracterInputProtocol: AnyObject {
    var presenter: HomeInteracterOutputProtocol? { get set }
    var localDataManager: ModelDatabaseHelperInputProtocol? { get set }
    
    func retrieveModel()
}

protocol HomeInteracterOutputProtocol: AnyObject {
    func didRetrieveModel(_ data: [Model])
}

