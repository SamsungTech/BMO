//
//  MultiPickerPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/08.
//

import Foundation

class MultiPickerPresenter: MultiPickerPresenterProtocol {
    weak var view: MultiPickerViewControllerProtocol?
    var interactor: MultiPickerInteractorInputProtocol?
    var router: MultiPickerRouterProtocol?
    
}

extension MultiPickerPresenter: MultiPickerInteractorOutputProtocol {
    
}
