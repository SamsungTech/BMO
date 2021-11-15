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
    
    func saveButtonDidTap(image: Data,
                          name: String,
                          type: String,
                          birth: Date,
                          relation: String) {
        interacter?.coredataSave(image: image,
                                 name: name,
                                 type: type,
                                 birth: birth,
                                 relation: relation)
    }
}

extension InitPresenter: InitInteracterOutputProtocol {
    func trivedDogInfoData(info: DogInfo) {
        print("dsd")
    }
    
    
}
