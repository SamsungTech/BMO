//
//  MemoViewProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

protocol MemoViewProtocol: AnyObject {
    var presenter: MemoViewPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showMemoView(forImage name: String)
}

protocol MemoViewRouterProtocol: AnyObject {
    static func createMemoViewRouter(from post: String) -> UIViewController
}

protocol MemoViewPresenterProtocol: AnyObject {
    var view: MemoViewProtocol? { get set }
    var wireFrame: MemoViewRouterProtocol? { get set }
    var name: String? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    
}
