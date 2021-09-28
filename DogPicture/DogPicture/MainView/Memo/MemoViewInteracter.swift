//
//  MemoViewInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit
import CoreData

class MemoViewInteracter: MemoViewInteracterInputProtocol {
    weak var presenter: MemoViewInteracterOutputProtocol?
    
    func dataBaseHelperUpdate(item: Model, memo: String) {
        DatabaseHelper.instance.updateItem(item: item, memo: memo)
    }
    func dataBaseHelperDelete(item: Model) {
        DatabaseHelper.instance.deleteItem(item: item)
    }
}

extension MemoViewInteracter: MemoViewInteracterOutputProtocol {
    
    
}
