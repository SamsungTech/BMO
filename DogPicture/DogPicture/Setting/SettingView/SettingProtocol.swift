//
//  SettingProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

protocol SettingViewProtocol: AnyObject {
    var presenter: SettingPresenterProtocol? { get set }
    
}

protocol SettingRouterProtocol: AnyObject {
    static func createSettingModule() -> UIViewController
    
    func presentLocalPushView(from view: SettingViewProtocol)
}

protocol SettingPresenterProtocol: AnyObject {
    var view: SettingViewProtocol? { get set }
    var interacter: SettingInteracterInputProtocol? { get set }
    var router: SettingRouterProtocol? { get set }
    
    func viewDidLoad()
    func showLocalPushView()
    func showProfileView()
}

protocol SettingInteracterInputProtocol: AnyObject {
    // Presenter -> Interacter
    var presenter: SettingInteracterOutputProtocol? { get set }
    var dataManager: SettingDataManagerInputProtocol? { get set }
}

protocol SettingInteracterOutputProtocol: AnyObject {
    // Interacter -> Presenter
}

protocol SettingDataManagerInputProtocol: AnyObject {
    // Interacter -> Datamanager
    var requestHandler: SettingDataManagerOutputProtocol? { get set }
    
}

protocol SettingDataManagerOutputProtocol: AnyObject {
    // Datamanager -> Interacter
    func retrivedData()
}
