//
//  DogInfoDatabaseHelper.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/06.
//

import Foundation
import UIKit
import CoreData

class DogInfoDatabaseHelper {
    static let instance = DogInfoDatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getAllItems() -> [DogInfo] {
        var dogInfo = [DogInfo]()
        do {
            dogInfo = try context.fetch(DogInfo.fetchRequest())
            print("가져오기 성공!")
        } catch {
            print("models 가져오기 실패")
        }
        return dogInfo
    }

    func createItem(dogName: String, dogBirthday: Date, dogGender: Bool,
                    dogWeight: Double, dogType: Int16, neutering: Bool, userName: String) {
        let newItem = DogInfo(context: context)
        newItem.dogName = dogName
        newItem.dogBirthday = dogBirthday
        newItem.dogGender = dogGender
        newItem.dogWeight = dogWeight
        newItem.dogType = dogType
        newItem.neutering = neutering
        newItem.userName = userName
        do {
            try context.save()
            print("createItem 성공")
        } catch {
            print("createItem 실패 ㅠㅠ")
        }
    }
    
    func updateItem(item: DogInfo, dogName: String, dogBirthday: Date, dogGender: Bool,
                    dogWeight: Double, dogType: Int16, neutering: Bool, userName: String)  {
        item.dogName = dogName
        item.dogBirthday = dogBirthday
        item.dogGender = dogGender
        item.dogWeight = dogWeight
        item.dogType = dogType
        item.neutering = neutering
        item.userName = userName
        if context.hasChanges {
            do {
                try context.save()
                print("update 성공")
            } catch {
                print("update 실패 ㅠㅠ")
            }
        }
    }
}
