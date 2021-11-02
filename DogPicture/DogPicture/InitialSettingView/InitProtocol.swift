//
//  InitProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/02.
//

import Foundation
import UIKit

protocol InitViewControllerProtocol: AnyObject {
    var presenter: InitPresenterProtocol? { get set }
    
}

protocol InitRouterProtocol: AnyObject {
    static func createInitModule() -> UIViewController
    
}

protocol InitPresenterProtocol: AnyObject {
    var view: InitViewControllerProtocol? { get set }
    var interacter: InitInteracterInputProtocol? { get set }
    var router: InitRouterProtocol? { get set }
    // image, name, type, birth, relation
    func saveButtonDidTap(image: Data, name: String, type: String, birth: Date, relation: String)
}

protocol InitInteracterInputProtocol: AnyObject {
    var presenter: InitInteracterOutputProtocol? { get set }
    
    func coredataSave(image: Data, name: String, type: String, birth: Date, relation: String)
}

protocol InitInteracterOutputProtocol: AnyObject {
    
}


