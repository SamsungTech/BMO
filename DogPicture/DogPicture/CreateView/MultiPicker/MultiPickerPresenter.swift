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
    
    func nextButtonCilcked(photo: [Data], date: [Date]) {
        interactor?.createSelectedItem(photo: photo, date: date)
    }
}

extension MultiPickerPresenter: MultiPickerInteractorOutputProtocol {
    
}
