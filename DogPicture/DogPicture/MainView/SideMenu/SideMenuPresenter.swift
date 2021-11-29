//
//  SideMenuPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/22.
//

import Foundation

class SideMenuPresenter: SideMenuPresenterProtocol {
    weak var view: SideMenuViewProtocol?
    var interactor: SideMenuInteractorInputProtocol?
    var router: SideMenuRouterProtocol?
    
    func dismiss() {
        guard let view = view else { return }
        router?.dismissSideMenu(view: view)
    }
}

extension SideMenuPresenter: SideMenuInteractorOutputProtocol {
    
}
