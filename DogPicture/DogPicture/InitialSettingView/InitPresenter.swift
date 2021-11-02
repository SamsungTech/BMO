//
//  InitPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/02.
//

import Foundation

class InitPresenter: InitPresenterProtocol {
    weak var view: InitViewControllerProtocol?
    var interacter: InitInteracterInputProtocol?
    var router: InitRouterProtocol?
    
    func saveButtonDidTap(image: Data, name: String, type: String, birth: Date, relation: String) {
        print("아직")
    }
}

extension InitPresenter: InitInteracterOutputProtocol {
    
}
