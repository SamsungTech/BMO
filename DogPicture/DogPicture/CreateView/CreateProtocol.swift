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
    
    func presentCameraView(presentingView: UITabBarController)
    func presentLibraryView()
    func presentDiraryView()
}

protocol CreatePresenterProtocol: AnyObject {
    var view: CreateViewControllerProtocol? { get set }
    var router: CreateRouterProtocol? { get set }
    var interactor: CreateInteractorInputProtocol? { get set }
    
    func cameraButtonClicked(presentingView: CustomTabBarControllerProtocol)
    func libraryButtonClicked()
    func diraryButtonClicked()
}

protocol CreateInteractorInputProtocol: AnyObject {
    var presenter: CreateInteractorOutputProtocol? { get set }
}

protocol CreateInteractorOutputProtocol: AnyObject {
    
}
