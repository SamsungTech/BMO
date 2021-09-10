//
//  Memo.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/09.
//

import Foundation

class Models {
    static let shared = Models()
    var petitImages: [String] = [ "p1", "p2", "p3", "p4", "p5" ]
    
    var content: [String] = [ "안뇽?", "얼빡샷좀 볼래!?", "그래 이짜슥아!", "-ㅅ-!!",
                              "아낙수나문"]
    var date: [String] = [ "2021년 9월 10일", "2021년 9월 11일",
                           "2021년 9월 10일", "2021년 9월 11일",
                           "2021년 9월 10일" ]
    
    func getDogImageList() -> [String] {
        return petitImages
    }
    func getMemoList() -> [String] {
        return content
    }
    func getDate() -> [String] {
        return date
    }
}
