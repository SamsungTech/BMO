//
//  MainPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    var interacter: MainInteracterInputProtocol?
    var router: MainRouterProtocol?
    
    func sideMenuButtonClicked() {
        guard let view = view else { return }
        router?.presentSideMenu(from: view)
    }
}

extension MainPresenter: MainInteracterOutputProtocol {
    
}
