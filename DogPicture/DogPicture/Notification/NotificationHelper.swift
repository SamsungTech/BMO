//
//  NotificationHelper.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/11.
//

import Foundation
import UserNotifications

class NotificationHelper {
    static let instance = NotificationHelper()
    
    func registerLocalNotification() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted,
            error in
            if granted {
                print("yay!")
            } else {
                print("D")
            }
        }
    }
    
    func notification(hour: Int, minute: Int) {
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
        
        let notificationContent = UNMutableNotificationContent()
        var dateFire = DateComponents()
        
        notificationContent.title = "제목 아무거나"
        notificationContent.body = "주인놈아 사진좀 찍어라~"
        notificationContent.badge = NSNumber(value: 1)
        notificationContent.sound = .default
        
        dateFire.hour = hour
        dateFire.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateFire, repeats: true)
        let request = UNNotificationRequest(identifier: "ID", content: notificationContent, trigger: trigger)
        center.add(request)
        print("알람등록 성공")
    }
    
}
