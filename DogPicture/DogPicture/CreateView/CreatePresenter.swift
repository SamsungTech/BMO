//
//  CreatePresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/27.
//

import Foundation

class CreatePresenter: CreatePresenterProtocol {
    weak var view: CreateViewControllerProtocol?
    var router: CreateRouterProtocol?
    var interactor: CreateInteractorInputProtocol?
    
    
    func cameraButtonClicked(presentingView: CustomTabBarControllerProtocol) {
        router?.presentCameraView(presentingView: presentingView)
    }
    
    func libraryButtonClicked() {
        print("ㅇㅇ")

    }
    
    func diraryButtonClicked() {
        print("ㅇㅇ")
    }
}

extension CreatePresenter: CreateInteractorOutputProtocol {
    
}
