//
//  LocalPushProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/06.
//

import Foundation
import UIKit

protocol LocalPushViewProtocol: AnyObject {
    var presenter: LocalPushPresenterProtocol? { get set }
}

protocol LocalPushRouterProtocol: AnyObject {
    static func createLocalPushModule() -> UIViewController
    
    func dismissLocalPushView(from view: LocalPushViewProtocol)
}

protocol LocalPushPresenterProtocol: AnyObject {
    var view: LocalPushViewProtocol? { get set }
    var interacter: LocalPushInteracterInputProtocol? { get set }
    var router: LocalPushRouterProtocol? { get set }
    
    func viewDidLoad()
    func cancelButtonClicked()
    func saveButtonClicked(hour: Int, minute: Int)
}

protocol LocalPushInteracterInputProtocol: AnyObject {
    var presenter: LocalPushInteracterOutputProtocol? { get set }
    var dataManager: LocalPushDataManagerInputProtocol? { get set }
    
    func setNotificationTime(hour: Int, minute: Int)
}

protocol LocalPushInteracterOutputProtocol: AnyObject {
    
}

protocol LocalPushDataManagerInputProtocol: AnyObject {
    
}
