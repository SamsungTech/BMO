//
//  MenuProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit

protocol MenuViewProtocol: AnyObject {
    var presenter: MenuPresenterProtocol? { get set }
}

protocol MenuRouterProtocol: AnyObject {
    static func createMenuModule() -> UIViewController
}

protocol MenuPresenterProtocol: AnyObject {
    var view: MenuViewProtocol? { get set }
    var router: MenuRouterProtocol? { get set }
}
