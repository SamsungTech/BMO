//
//  CaptureProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import UIKit

protocol PreviewViewProtocol: AnyObject {
    var presenter: PreviewPresenterProtocol? { get set }
}

protocol PreviewRouterProtocol: AnyObject {
    static func createPreviewModule() -> UIViewController 
}

protocol PreviewPresenterProtocol: AnyObject {
    var view: PreviewViewProtocol? { get set }
    var interacter: PreviewInteracterInputProtocol? { get set }
    var router: PreviewRouterProtocol? { get set }
    
    
}

protocol PreviewInteracterInputProtocol: AnyObject {
    var presenter: PreviewInteracterOutputProtocol? { get set }
    
}

protocol PreviewInteracterOutputProtocol: AnyObject {
    
}
