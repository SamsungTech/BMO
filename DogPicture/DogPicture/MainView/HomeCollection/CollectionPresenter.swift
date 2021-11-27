//
//  CollectionPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation

class CollectionPresenter: CollectionPresenterProtocol {
    weak var view: CollectionViewProtocol?
    var router: CollectionRouterProtocol?
    var interacter: CollectionInteracterInputProtocol?
    
    
}

extension CollectionPresenter: CollectionInteracterOutputProtocol {
    
}


