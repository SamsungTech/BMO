//
//  MemoViewPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

class MemoViewPresenter: MemoViewPresenterProtocol {
    weak var view: MemoViewProtocol?
    var wireFrame: MemoViewRouterProtocol?
    var name: String?
    
    func viewDidLoad() {
        view?.showMemoView(forImage: name ?? "")
    }
}
