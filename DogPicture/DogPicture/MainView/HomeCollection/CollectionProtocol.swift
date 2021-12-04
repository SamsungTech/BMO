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
    
    func containModelData(data: [Model])
}

protocol CollectionRouterProtocol: AnyObject {
    static func createCollectionModule() -> UIViewController
    
}

protocol CollectionPresenterProtocol: AnyObject {
    var view: CollectionViewProtocol? { get set }
    var router: CollectionRouterProtocol? { get set }
    var interacter: CollectionInteracterInputProtocol? { get set }
    
    func viewDidLoad()
}

protocol CollectionInteracterInputProtocol: AnyObject {
    var presenter: CollectionInteracterOutputProtocol? { get set }
    
    func retriveDogImageData()
}

protocol CollectionInteracterOutputProtocol: AnyObject {
    func retrivedDogImageData(data: [Model])
}

