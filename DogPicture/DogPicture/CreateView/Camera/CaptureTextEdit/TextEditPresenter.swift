//
//  TextEditPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/03.
//

import Foundation

class TextEditPresenter: TextEditPresenterProtocol {
    weak var view: TextEditViewControllerProtocol?
    var interactor: TextEditInteractorInputProtocol?
    var router: TextEditRouterProtocol?
}

extension TextEditPresenter: TextEditInteractorOutputProtocol {
    
}
