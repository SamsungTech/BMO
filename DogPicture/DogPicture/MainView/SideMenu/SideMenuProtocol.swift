//
//  SideMenuProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/22.
//

import Foundation
import UIKit

protocol SideMenuViewProtocol: AnyObject {
    var presenter: SideMenuPresenterProtocol? { get set }
    
    func viewDidLoad()
}

protocol SideMenuRouterProtocol: AnyObject {
    static func createSideMenuViewModule() -> UIViewController
    
    func dismissSideMenu(view: SideMenuViewProtocol)
}

protocol SideMenuPresenterProtocol: AnyObject {
    var view: SideMenuViewProtocol? { get set }
    var interactor: SideMenuInteractorInputProtocol? { get set }
    var router: SideMenuRouterProtocol? { get set }
    
    func dismiss()
}

protocol SideMenuInteractorInputProtocol: AnyObject {
    var presenter: SideMenuInteractorOutputProtocol? { get set }
}

protocol SideMenuInteractorOutputProtocol: AnyObject {
    
}
