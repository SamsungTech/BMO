//
//  LocalPushInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/06.
//

import Foundation

class LocalPushInteracter: LocalPushInteracterInputProtocol {
    var presenter: LocalPushInteracterOutputProtocol?
    var dataManager: LocalPushDataManagerInputProtocol?
    
    func setNotificationTime(hour: Int, minute: Int) {
        NotificationHelper.instance.notification(hour: hour, minute: minute)
    }
}

extension LocalPushInteracter: LocalPushInteracterOutputProtocol {
    
}
