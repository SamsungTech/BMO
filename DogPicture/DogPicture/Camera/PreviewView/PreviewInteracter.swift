//
//  CaptureInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import Foundation

class PreviewInteracter: PreviewInteracterInputProtocol {
    
    weak var presenter: PreviewInteracterOutputProtocol?
    
    func prepareImageForSaving(image: Data) {
        
    }
    func saveImageData(photo: Data, date: Date, memo: String) {
        print(photo,"데이터 interacter에 들어왔습니다.")
        DatabaseHelper.instance.saveImageInCoredata(photo: photo, date: date, memo: memo)
    }
}

extension PreviewInteracter: PreviewInteracterOutputProtocol {
    
}
