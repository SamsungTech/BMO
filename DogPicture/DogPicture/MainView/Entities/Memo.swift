//
//  Memo.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/09.
//

import Foundation

class Memo {
    var content: String
    var insertDate: Date
    
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    static var dummyMemoList = [
        Memo(content: "안뇽~"),
        Memo(content: "얼빡샷좀 볼래!?")
    ]
}
