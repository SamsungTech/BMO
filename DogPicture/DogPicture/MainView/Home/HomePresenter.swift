//
//  HomeViewPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

class HomePresenter: HomePresenterProtocol {
    var interacter: HomeInteracterInputProtocol?
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    
    
    
    func showMemo(for name: String) {
        router?.presentMemoScreen(from: view!, forname: name)
    }
}

