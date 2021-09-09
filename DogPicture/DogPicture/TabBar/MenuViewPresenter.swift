//
//  MenuPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/07/13.
//

import Foundation

class MenuViewPresenter: MenuViewPresenterProtocol {
    weak var view: MenuViewProtocol?
    var interacter: MenuViewInteracterInputProtocol?
    var router: MenuViewRouterProtocol?
    
}

extension MenuViewPresenter: MenuViewInteracterOutputProtocol {
    
}
