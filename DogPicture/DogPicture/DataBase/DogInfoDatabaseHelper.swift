//
//  DogInfoDatabaseHelper.swift
//  DogPicture
//
//  Created by 김동우 on 2021/10/06.
//

import Foundation
import UIKit
import CoreData

class DogInfoDatabaseHelper: SettingDataManagerInputProtocol {
    var requestHandler: SettingDataManagerOutputProtocol?
    
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
    
    func createItem(image: Data,
                    name: String,
                    type: String,
                    birth: Date,
                    relation: String) -> DogInfo {
        let newItem = DogInfo(context: context)
        newItem.do {
            $0.dogImage = image
            $0.dogName = name
            $0.dogType = type
            $0.dogBirthday = birth
            $0.dogRelation = relation
        }
        do {
            try context.save()
            print("createItem 성공")
        } catch {
            print("createItem 실패 ㅠㅠ")
        }
        return newItem
    }
    
    func updateItem(item: DogInfo,
                    image: Data,
                    name: String,
                    type: String,
                    birth: Date,
                    relation: String)  {
        item.do {
            $0.dogImage = image
            $0.dogName = name
            $0.dogType = type
            $0.dogBirthday = birth
            $0.dogRelation = relation
        }
        if context.hasChanges {
            do {
                try context.save()
                print("update 성공")
            } catch {
                print("update 실패 ㅠㅠ")
            }
        }
    }
    
    func createModelItem(info: DogInfo,
                         photo: Data,
                         memo: String,
                         date: Date) {
        let newModel = Model(context: context)
        newModel.do {
            $0.photo = photo
            $0.memo = memo
            $0.date = date
            $0.dogInfo = info
        }
        info.addToModel(newModel)
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
