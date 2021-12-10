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
        guard let view = view else { return }
        router?.presentCameraView(view: view, presentingView: presentingView)
    }
    
    func libraryButtonClicked(presentingView: CustomTabBarControllerProtocol) {
        guard let view = view else { return }
        router?.presentLibraryView(view: view, presentingView: presentingView)
    }
    
    func diraryButtonClicked() {
        print("ㅇㅇ")
    }
    
    func dismiss() {
        guard let view = view else { return }
        router?.dismissView(view: view)
    }
}

extension CreatePresenter: CreateInteractorOutputProtocol {
    
}
