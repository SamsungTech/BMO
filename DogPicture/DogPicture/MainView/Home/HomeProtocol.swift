//
//  HomeViewProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
}

protocol HomeRouterProtocol: AnyObject {
    static func createHomeModule() -> UIViewController
    
    func presentMemoScreen(from view: HomeViewProtocol, forname name: String)
    
    
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interacter: HomeInteracterInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    
    func showMemo(for name: String)
    
}

protocol HomeInteracterInputProtocol: AnyObject {
    var presenter: HomeInteracterOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    
}

protocol HomeInteracterOutputProtocol: AnyObject {
    
}
