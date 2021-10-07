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
}

protocol LocalPushPresenterProtocol: AnyObject {
    var view: LocalPushViewProtocol? { get set }
    var interacter: LocalPushInteracterInputProtocol? { get set }
    var router: LocalPushRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol LocalPushInteracterInputProtocol: AnyObject {
    var presenter: LocalPushInteracterOutputProtocol? { get set }
    var dataManager: LocalPushDataManagerInputProtocol? { get set }
}

protocol LocalPushInteracterOutputProtocol: AnyObject {
    
}

protocol LocalPushDataManagerInputProtocol: AnyObject {
    
}

protocol LocalPushDataMangerOutputProtocol: AnyObject {
    
}
