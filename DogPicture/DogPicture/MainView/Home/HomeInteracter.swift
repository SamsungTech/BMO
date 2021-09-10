//
//  HomeViewInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

class HomeInteracter: HomeInteracterInputProtocol {
    weak var presenter: HomeInteracterOutputProtocol?
    let dogImages = Models.shared.getDogImageList()
    
    func getDogImage() {
        presenter?.retrivedDogImage(images: dogImages)
    }
    func getDate() {
        presenter?.retrivedImageDate(date: dogImages)
    }
    func getImageContent() {
        presenter?.retrivedImageContent(content: dogImages)
    }
}
