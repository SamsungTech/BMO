//
//  MainProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
}

protocol MainRouterProtocol: AnyObject {
    static func createMainModule() -> UIViewController
    
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var interacter: MainInteracterInputProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
}

protocol MainInteracterOutputProtocol: AnyObject {
    
}

protocol MainInteracterInputProtocol: AnyObject {
    var presenter: MainInteracterOutputProtocol? { get set }
}
