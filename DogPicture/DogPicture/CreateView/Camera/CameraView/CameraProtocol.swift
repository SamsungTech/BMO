//
//  CameraProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit

protocol CameraViewProtocol: AnyObject {
    var presenter: CameraPresenterProtocol? { get set }
    
}

protocol CameraRouterProtocol: AnyObject {
    static func createCameraModule() -> UIViewController
    
    func presentPreview(from view: CameraViewProtocol, data: Data)
}

protocol CameraPresenterProtocol: AnyObject {
    var view: CameraViewProtocol? { get set }
    var interacter: CameraInteracterInputProtocol? { get set }
    var router: CameraRouterProtocol? { get set }
    
    func showCamera()
    func showPreview(imageData: Data)
}

protocol CameraInteracterInputProtocol: AnyObject {
    var presenter: CameraInteracterOutputProtocol? { get set }
    
}

protocol CameraInteracterOutputProtocol: AnyObject {
    
}
