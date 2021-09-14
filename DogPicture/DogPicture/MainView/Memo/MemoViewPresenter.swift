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
    var name: String?
    
    func viewDidLoad() {
        view?.showMemoView(forImage: name ?? "")
    }
    func memoViewDismiss() {
        guard let view = view else { return }
        router?.dismissMemoViewController(from: view)
    }
}

extension MemoViewPresenter: MemoViewInteracterOutputProtocol {
    
}
