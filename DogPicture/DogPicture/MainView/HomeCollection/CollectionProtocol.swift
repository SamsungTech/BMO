//
//  CollectionProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation
import UIKit

protocol CollectionViewProtocol: AnyObject {
    var presenter: CollectionPresenterProtocol? { get set }
    
}

protocol CollectionRouterProtocol: AnyObject {
    static func createCollectionModule() -> UIViewController
    
}

protocol CollectionPresenterProtocol: AnyObject {
    var view: CollectionViewProtocol? { get set }
    var router: CollectionRouterProtocol? { get set }
    var interacter: CollectionInteracterInputProtocol? { get set }
    
}

protocol CollectionInteracterInputProtocol: AnyObject {
    var presenter: CollectionInteracterOutputProtocol? { get set }
}

protocol CollectionInteracterOutputProtocol: AnyObject {
    
}

