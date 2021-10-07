//
//  SettingInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import Foundation

class SettingInteracter: SettingInteracterInputProtocol {
    weak var presenter: SettingInteracterOutputProtocol?
    var dataManager: SettingDataManagerInputProtocol?
    
}

extension SettingInteracter: SettingDataManagerOutputProtocol {
    func retrivedData() {
    }
    
    
}
