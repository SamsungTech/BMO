//
//  MemoViewPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//
import Foundation

class MemoViewPresenter: MemoViewPresenterProtocol {
    weak var view: MemoViewProtocol?
    
    var interacter: MemoViewInteracterInputProtocol?
    var router: MemoViewRouterProtocol?
    var model: Model?
    
    func viewDidLoad() {
        if let model = model {
            view?.showMemoView(for: model)
        }
    }
    func memoViewDismiss() {
        guard let view = view else { return }
        router?.dismissMemoViewController(from: view)
    }
    func passDataToUpdate(item: Model, memo: String) {
        interacter?.dataBaseHelperUpdate(item: item, memo: memo)
    }
    func passDataToDelete(item: Model) {
        interacter?.dataBaseHelperDelete(item: item)
    }
}

extension MemoViewPresenter: MemoViewInteracterOutputProtocol {
    
}
