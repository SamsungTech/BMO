//
//  HomeViewPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    var interacter: HomeInteracterInputProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {
    }
    
    func showMemo(for name: String) {
        router?.presentMemoScreen(from: view!, forname: name)
    }
}

extension HomePresenter: HomeInteracterOutputProtocol {
    func didRetrieveImage(_ images: [String]) {
        print(images)
    }
    
    func onError() {
    }
}
