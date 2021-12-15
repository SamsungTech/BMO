//
//  MultiPickerInteractor.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/08.
//

import Foundation

class MultiPickerInteractor: MultiPickerInteractorInputProtocol {
    weak var presenter: MultiPickerInteractorOutputProtocol?
    
    func createSelectedItem(photo: [Data], date: [Date]) {
        for i in 0..<photo.count {
            let imageData = photo[i]
            let imageDate = date[i]
            
            ModelDatabaseHelper.instance.createSelectedItem(photo: imageData, date: imageDate)
        }
    }
}
