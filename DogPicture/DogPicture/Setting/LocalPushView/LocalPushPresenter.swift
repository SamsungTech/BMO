//
//  LocalPushPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/06.
//

import Foundation

class LocalPushPresenter: LocalPushPresenterProtocol {
    weak var view: LocalPushViewProtocol?
    var interacter: LocalPushInteracterInputProtocol?
    var router: LocalPushRouterProtocol?
    
    func viewDidLoad() {
        
    }
    
    
}

extension LocalPushPresenter: LocalPushInteracterOutputProtocol {
    
}
