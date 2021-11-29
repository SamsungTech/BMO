//
//  SideMenuInteractor.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/22.
//

import Foundation

class SideMenuInteractor: SideMenuInteractorInputProtocol {
    weak var presenter: SideMenuInteractorOutputProtocol?
    
}

extension SideMenuInteractor: ModelDatabaseHelperOutputProtocol {
    func modelDataRetrived() {
        print("모델 데이터 가져오기")
    }
}
