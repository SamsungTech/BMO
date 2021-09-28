//
//  MemoViewProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

protocol MemoViewProtocol: AnyObject {
    var presenter: MemoViewPresenterProtocol? { get set }
    
    func showMemoView(for model: Model)
}

protocol MemoViewRouterProtocol: AnyObject {
    static func createMemoViewRouter(from model: Model) -> UIViewController
    
    func dismissMemoViewController(from view: MemoViewProtocol)
}

protocol MemoViewPresenterProtocol: AnyObject {
    var view: MemoViewProtocol? { get set }
    var interacter: MemoViewInteracterInputProtocol? { get set }
    var router: MemoViewRouterProtocol? { get set }
    var model: Model? { get set }
    
    func viewDidLoad()
    func memoViewDismiss()
    func passDataToUpdate(item: Model, memo: String)
    func passDataToDelete(item: Model)
}

protocol MemoViewInteracterInputProtocol: AnyObject {
    var presenter: MemoViewInteracterOutputProtocol? { get set }
    
    func dataBaseHelperUpdate(item: Model, memo: String)
    func dataBaseHelperDelete(item: Model)
}

protocol MemoViewInteracterOutputProtocol: AnyObject {
}
