//
//  MenuProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/30.
//

import UIKit

protocol MenuViewProtocol: AnyObject {
    var presenter: MenuViewPresenterProtocol? { get set }
}

protocol MenuViewRouterProtocol: AnyObject {
    static func createMenuModule() -> UIViewController
}

protocol MenuViewPresenterProtocol: AnyObject {
    var view: MenuViewProtocol? { get set }
    var interacter: MenuViewInteracterInputProtocol? { get set }
    var router: MenuViewRouterProtocol? { get set }
    
}

protocol MenuViewInteracterInputProtocol: AnyObject {
    var presenter: MenuViewInteracterOutputProtocol? { get set }
}

protocol MenuViewInteracterOutputProtocol: AnyObject {
    
}
