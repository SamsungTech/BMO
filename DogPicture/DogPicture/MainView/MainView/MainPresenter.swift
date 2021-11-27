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
    
    
}

extension MainPresenter: MainInteracterOutputProtocol {
    
}
