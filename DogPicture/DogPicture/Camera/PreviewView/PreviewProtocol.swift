//
//  CaptureProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import UIKit

protocol PreviewViewProtocol: AnyObject {
    var presenter: PreviewPresenterProtocol? { get set }
    
    func showPreviewImage(forImage data: Data)
}

protocol PreviewRouterProtocol: AnyObject {
    static func createPreviewModule(forImage data: Data) -> UIViewController
    
    func presentHomeScreen(from view: PreviewViewProtocol)
}

protocol PreviewPresenterProtocol: AnyObject {
    var view: PreviewViewProtocol? { get set }
    var interacter: PreviewInteracterInputProtocol? { get set }
    var router: PreviewRouterProtocol? { get set }
    var data: Data? { get set }
    
    func viewDidLoad()
    func handOverImageData(photo: Data, memo: String)
}

protocol PreviewInteracterInputProtocol: AnyObject {
    var presenter: PreviewInteracterOutputProtocol? { get set }
    
    func saveImageData(photo: Data, memo: String)
}

protocol PreviewInteracterOutputProtocol: AnyObject {
    
}
