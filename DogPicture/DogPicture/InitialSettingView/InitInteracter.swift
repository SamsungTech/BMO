//
//  InitInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/02.
//

import Foundation

class InitInteracter: InitInteracterInputProtocol {
    weak var presenter: InitInteracterOutputProtocol?
    
    func coredataSave(image: Data, name: String, type: String, birth: Date, relation: String) {
        print("헬예")
    }
}
