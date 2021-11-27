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
    var data: Data?
    var date: Date?
    var memo: String?
    
    func viewDidLoad() {
        if let data = data {
            view?.showPreviewImage(forImage: data)
        }
    }
    func handOverImageData(photo: Data, memo: String) {
        interacter?.saveImageData(photo: photo, memo: memo)
    }
    
}

extension PreviewPresenter: PreviewInteracterOutputProtocol {
    
}
