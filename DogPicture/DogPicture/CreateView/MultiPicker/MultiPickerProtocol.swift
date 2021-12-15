//
//  MultiPickerProtocol.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/08.
//

import Foundation
import UIKit

protocol MultiPickerViewControllerProtocol: AnyObject {
    var presenter: MultiPickerPresenterProtocol? { get set }
    
}

protocol MultiPickerRouterProtocol: AnyObject {
    static func createMultiPickerViewModule() -> UIViewController
    
}

protocol MultiPickerPresenterProtocol: AnyObject {
    var view: MultiPickerViewControllerProtocol? { get set }
    var interactor: MultiPickerInteractorInputProtocol? { get set }
    var router: MultiPickerRouterProtocol? { get set }
    
    func nextButtonCilcked(photo: [Data], date: [Date])
}

protocol MultiPickerInteractorOutputProtocol: AnyObject {
    
}

protocol MultiPickerInteractorInputProtocol: AnyObject {
    var presenter: MultiPickerInteractorOutputProtocol? { get set }
    
    func createSelectedItem(photo: [Data], date: [Date])
}
