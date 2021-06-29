//
//  CameraProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

protocol CameraViewControllerProtocol: AnyObject {
    var presenter: CameraPresenterProtocol? { get set }
    
    
    
}

protocol CameraRouterProtocol: AnyObject {
    static func createCameraModule() -> UIViewController
    
    
}

protocol CameraPresenterProtocol: AnyObject {
    var view: CameraViewControllerProtocol? { get set }
    var interacter: CameraInteracterInputProtocol? { get set }
    var router: CameraRouterProtocol? { get set }
    
    func showCamera()
    
}

protocol CameraInteracterInputProtocol: AnyObject {
    var presenter: CameraInteracterOutputProtocol? { get set }
    
    
}

protocol CameraInteracterOutputProtocol: AnyObject {
    
    
    
}
