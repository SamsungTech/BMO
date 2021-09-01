//
//  HomeViewPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//
import Foundation
import UIKit

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    var interacter: HomeInteracterInputProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {
        interacter?.getChuImage()
    }
    
    func segmentDidTap() {
        view?.segmentDidChanged()
    }
    
    func segmentAnimation() {
        view?.segmentAnimation()
    }
    
    func showMemo(for name: String) {
        router?.presentMemoScreen(from: view!, forname: name)
    }
    
    func calenderDidTap(tag: Int) {
        view?.refershCalender(tag: tag)
    }
}

extension HomePresenter: HomeInteracterOutputProtocol {
    func retrivedChuImage(chu: [UIImage?]) { // ??
        view?.showChu(chu: chu)
    }
    
    func didRetrieveImage(_ images: [String]) {
        print(images)
    }
    
    func onError() {
    }
}
