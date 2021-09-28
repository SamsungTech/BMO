//
//  HomeViewPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//
import Foundation

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interacter: HomeInteracterInputProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {
        interacter?.retrieveModel()
    }
    func showMemo(for model: Model) {
        guard let view = view else { return }
        router?.presentMemoScreen(from: view, forname: model)
    }
    func calenderDidTap(tag: Int) {
        view?.refershCalender(tag: tag)
    }
}

extension HomePresenter: HomeInteracterOutputProtocol {
    func didRetrieveModel(_ model: [Model]) {
        view?.showModels(with: model)
    }
}
