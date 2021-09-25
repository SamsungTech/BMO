//
//  HomeViewInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

class HomeInteracter: HomeInteracterInputProtocol {
    
    
    weak var presenter: HomeInteracterOutputProtocol?
    
    func getDogImage() {
        let dogImages = Image.shared.getDogImageList()
        presenter?.retrivedDogImage(images: dogImages)
    }
}
