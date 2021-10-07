//
//  SettingPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import Foundation

class SettingPresenter: SettingPresenterProtocol {
    weak var view: SettingViewProtocol?
    var interacter: SettingInteracterInputProtocol?
    var router: SettingRouterProtocol?
    
    func viewDidLoad() {
        
    }
    func showLocalPushView() {
        guard let view = view else { return }
        router?.presentLocalPushView(from: view)
    }
    func showProfileView() {
        
    }
}

extension SettingPresenter: SettingInteracterOutputProtocol {
    
}
