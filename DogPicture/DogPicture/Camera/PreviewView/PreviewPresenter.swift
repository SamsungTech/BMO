//
//  CapturePresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import Foundation

class PreviewPresenter: PreviewPresenterProtocol {
    var view: PreviewViewProtocol?
    var interacter: PreviewInteracterInputProtocol?
    var router: PreviewRouterProtocol?
    
    
}

extension PreviewPresenter: PreviewInteracterOutputProtocol {
    
}
