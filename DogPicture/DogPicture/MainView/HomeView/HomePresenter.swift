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
    func showMemo(for model: Model, index: IndexPath) {
        guard let view = view else { return }
        router?.presentMemoScreen(from: view, forname: model, index: index)
    }
    func calenderDidTap(tag: Int) {
        view?.refershCalender(tag: tag)
    }
    func sideMenuButtonClicked() {
        guard let view = view else { return }
        router?.presentSideMenu(from: view)
    }
}

extension HomePresenter: HomeInteracterOutputProtocol {
    func didRetrieveModel(_ model: [Model]) {
        view?.showModels(with: model)
    }
}
