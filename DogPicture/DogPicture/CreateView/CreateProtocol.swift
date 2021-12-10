//
//  CreateProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/27.
//

import Foundation
import UIKit

protocol CreateViewControllerProtocol: AnyObject {
    var presenter: CreatePresenterProtocol? { get set }
    
    func viewDidLoad()
}

protocol CreateRouterProtocol: AnyObject {
    static func createCreateViewModule() -> UIViewController
    
    func presentCameraView(view: CreateViewControllerProtocol, presentingView: UITabBarController)
    func presentLibraryView(view: CreateViewControllerProtocol, presentingView: UITabBarController)
    func presentDiraryView()
    func dismissView(view: CreateViewControllerProtocol)
}

protocol CreatePresenterProtocol: AnyObject {
    var view: CreateViewControllerProtocol? { get set }
    var router: CreateRouterProtocol? { get set }
    var interactor: CreateInteractorInputProtocol? { get set }
    
    func cameraButtonClicked(presentingView: CustomTabBarControllerProtocol)
    func libraryButtonClicked(presentingView: CustomTabBarControllerProtocol)
    func diraryButtonClicked()
    func dismiss()
}

protocol CreateInteractorInputProtocol: AnyObject {
    var presenter: CreateInteractorOutputProtocol? { get set }
}

protocol CreateInteractorOutputProtocol: AnyObject {
    
}
