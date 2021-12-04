//
//  TextEditInteractor.swift
//  DogPicture
//
//  Created by 김동우 on 2021/12/03.
//

import Foundation

class TextEditInteractor: TextEditInteractorInputProtocol {
    weak var presenter: TextEditInteractorOutputProtocol?
    
    func saveData(photo: Data, text: String) {
        ModelDatabaseHelper.instance.createModelItem(photo: photo, memo: text)
    }
}

extension TextEditInteractor {
    
}
