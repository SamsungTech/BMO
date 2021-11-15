//
//  InitInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/02.
//

import Foundation

class InitInteracter: InitInteracterInputProtocol {
    weak var presenter: InitInteracterOutputProtocol?
    
    func coredataSave(image: Data,
                      name: String,
                      type: String,
                      birth: Date,
                      relation: String) {
        let dogInfoData = DogInfoDatabaseHelper.instance.createItem(image: image,
                                                                    name: name,
                                                                    type: type,
                                                                    birth: birth,
                                                                    relation: relation)
    }
}
