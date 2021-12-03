//
//  CapturePresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import Foundation

class PreviewPresenter: PreviewPresenterProtocol {
    weak var view: PreviewViewProtocol?
    var interacter: PreviewInteracterInputProtocol?
    var router: PreviewRouterProtocol?
    var data: [Data]?
    
    func viewDidLoad() {
        if let data = data {
            view?.showPreviewImage(forImage: data)
        }
    }
    func popButtonCilcked() {
        guard let view = view else { return }
        router?.popPreview(view: view)
    }
}

extension PreviewPresenter: PreviewInteracterOutputProtocol {
    
}
