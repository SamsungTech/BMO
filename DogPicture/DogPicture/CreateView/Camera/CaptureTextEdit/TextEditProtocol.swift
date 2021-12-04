//
//  TextEditProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/03.
//

import Foundation
import UIKit

protocol TextEditViewControllerProtocol: AnyObject {
    var presenter: TextEditPresenterProtocol? { get set }
    
}

protocol TextEditRouterProtocol: AnyObject {
    static func createTextEditViewModule(selectedPhoto data: Data) -> UIViewController
    
    func popTextEditView(view: TextEditViewControllerProtocol)
    func dismissTextEditView(view: TextEditViewControllerProtocol)
}

protocol TextEditPresenterProtocol: AnyObject {
    var view: TextEditViewControllerProtocol? { get set }
    var interactor: TextEditInteractorInputProtocol? { get set }
    var router: TextEditRouterProtocol? { get set }
    var data: Data? { get set }
    
    func viewDidLoad()
    func popButtonCilcked()
    func completeButtonCilcked(text: String)
}

protocol TextEditInteractorOutputProtocol: AnyObject {
    
}

protocol TextEditInteractorInputProtocol: AnyObject {
    var presenter: TextEditInteractorOutputProtocol? { get set }
    
    func saveData(photo: Data, text: String)
}
