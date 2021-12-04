//
//  TextEditPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/03.
//

import Foundation

class TextEditPresenter: TextEditPresenterProtocol {
    weak var view: TextEditViewControllerProtocol?
    var interactor: TextEditInteractorInputProtocol?
    var router: TextEditRouterProtocol?
    var data: Data?
    
    func viewDidLoad() {
        
    }
    
    func popButtonCilcked() {
        guard let view = view else { return }
        router?.popTextEditView(view: view)
    }
    func completeButtonCilcked(text: String) {
        guard let view = view else { return }
        guard let data = data else { return }
        interactor?.saveData(photo: data, text: text)
        router?.dismissTextEditView(view: view)
    }
}

extension TextEditPresenter: TextEditInteractorOutputProtocol {
    
}
