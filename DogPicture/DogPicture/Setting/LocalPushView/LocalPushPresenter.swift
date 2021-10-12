//
//  LocalPushPresenter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/06.
//

import Foundation

class LocalPushPresenter: LocalPushPresenterProtocol {
    weak var view: LocalPushViewProtocol?
    var interacter: LocalPushInteracterInputProtocol?
    var router: LocalPushRouterProtocol?
    
    func viewDidLoad() {
        
    }
    func cancelButtonClicked() {
        if let view = view {
            router?.dismissLocalPushView(from: view)
        }
    }
    func saveButtonClicked(hour: Int, minute: Int) {
        interacter?.setNotificationTime(hour: hour, minute: minute)
    }
}

extension LocalPushPresenter: LocalPushInteracterOutputProtocol {
    
}
