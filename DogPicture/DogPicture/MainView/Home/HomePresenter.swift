//
//  HomeViewPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//
import Foundation

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interacter: HomeInteracterInputProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {
        interacter?.getDogImage()
        interacter?.getDate()
        interacter?.getImageContent()
    }
    
    func showMemo(for name: String) {
        router?.presentMemoScreen(from: view!, forname: name)
    }
    
    func calenderDidTap(tag: Int) {
        view?.refershCalender(tag: tag)
    }
}

extension HomePresenter: HomeInteracterOutputProtocol {
    func retrivedDogImage(images: [String]) {
        view?.showImages(images: images)
    }
    
    func retrivedImageDate(date: [String]) {
        view?.showImagesDate(date: date)
    }
    
    func retrivedImageContent(content: [String]) {
        view?.showImagesContent(content: content)
    }
}
