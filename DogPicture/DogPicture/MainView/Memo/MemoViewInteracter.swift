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
    
}

extension MemoViewInteracter: MemoViewInteracterOutputProtocol {
    
}
