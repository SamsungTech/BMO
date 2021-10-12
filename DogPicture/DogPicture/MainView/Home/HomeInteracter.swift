//
//  HomeViewInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

class HomeInteracter: HomeInteracterInputProtocol {
    weak var presenter: HomeInteracterOutputProtocol?
    var dataHolder: [Model] = []
    
    func retrieveModel() {
        dataHolder = DatabaseHelper.instance.getAllItems()
        presenter?.didRetrieveModel(dataHolder)
    }
    func notificationRegister() {
        NotificationHelper.instance.registerLocalNotification()
    }
}
