//
//  HomeViewInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

class HomeInteracter: HomeInteracterInputProtocol {
    
    weak var presenter: HomeInteracterOutputProtocol?
    
    func getChuImage() {
        let chuList = Image.shared.getChuImageList()
        presenter?.retrivedChuImage(chu: chuList)
    }
}

