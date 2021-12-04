//
//  CollectionInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/22.
//

import Foundation

class CollectionInteracter: CollectionInteracterInputProtocol {
    var presenter: CollectionInteracterOutputProtocol?
    var dataHolder: [Model] = []
    
    func retriveDogImageData() {
        dataHolder = ModelDatabaseHelper.instance.getModelItems()
        presenter?.retrivedDogImageData(data: dataHolder)
    }
}
