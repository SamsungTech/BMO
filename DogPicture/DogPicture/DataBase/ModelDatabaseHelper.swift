//
//  DatabaseHelper.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/19.
//

import Foundation
import UIKit
import CoreData

protocol ModelDatabaseHelperInputProtocol: AnyObject {
    func createModelItem(photo: Data, memo: String)
    func deleteItem(items: Model)
    func updateItem(item: Model, memo: String)
    func createSelectedItem(photo: Data, date: Date) 
}

protocol ModelDatabaseHelperOutputProtocol: AnyObject {
    // 요청한 값 다시 리턴하기 예) getItem 하고 return 값을 돌려주는 메소드
    func modelDataRetrived()
    
}

class ModelDatabaseHelper: ModelDatabaseHelperInputProtocol {
    
    static let instance = ModelDatabaseHelper()
    
    var remoteRequestHandler: ModelDatabaseHelperOutputProtocol?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    func getAllItems() -> [DogInfo] {
        var info = [DogInfo]()
        do {
            print("DogInfo 안에 Model 데이터 가져오기 성공!")
            info = try context.fetch(DogInfo.fetchRequest())
        } catch {
            print("DogInfo 안에 Model 데이터 가져오기 실패")
        }
        return info
    }
    
    
    func updateData() {
        
        // DogInfo data fetchRequest
        var info = [DogInfo]()
        do {
            print("DogInfo 안에 Model 데이터 가져오기 성공!")
            info = try context.fetch(DogInfo.fetchRequest())
        } catch {
            print("DogInfo 안에 Model 데이터 가져오기 실패")
        }
        
        // DogInfo [0] 배열에 있는 Model Data 가져오기
        var model = [Model]()
        guard let infoModel = info[0].model else { return }
        
        model = Array(infoModel)
        
        
        do {
            try context.save()
            print("createItem 성공")
        } catch {
            print("createItem 실패 ㅠㅠ")
        }
        
//        do {
//            let test = try context.fetch(fetchRequest)
//            let objectUpdate = test[0] as! NSManagedObject
//            objectUpdate.setValue("newName", forKey: "username")
//            objectUpdate.setValue("newEmail", forKey: "email")
//            do {
//                try context.save()
//            } catch {
//                print(error)
//            }
//        }
//        catch {
//            print(error)
//        }
        
    }
    
    
    
    
    
    
    
    
    
    
    func modelItems() -> [Model] {
        var models = [Model]()
        do {
            print("DogInfo 안에 Model 데이터 가져오기 성공!")
            models = try context.fetch(Model.fetchRequest())
        } catch {
            print("DogInfo 안에 Model 데이터 가져오기 실패")
        }
        return models
    }
    
    func getModelItems() -> [Model] {
        let info = getAllItems()
        let models = modelItems()
        var model = [Model]()
        
        for i in 0..<models.count {
            if models[i].dogInfo == info[0] {
                model.append(models[i])
                print("성공")
            }
            print("실패 하...")
        }
        return model
    }
    
    func createModelItem(photo: Data, memo: String)   {
        let newItem = Model(context: context)
        let info = getAllItems()
        
        newItem.photo = photo
        newItem.memo = memo
        newItem.date = Date()
        
        info[0].addToModel(newItem)
        do {
            try context.save()
            print("createItem 성공")
        } catch {
            print("createItem 실패 ㅠㅠ")
        }
    }
    
    func createSelectedItem(photo: Data, date: Date)   {
        let newItem = Model(context: context)
        let info = getAllItems()
        
        newItem.photo = photo
        newItem.memo = ""
        newItem.date = date
        
        info[0].addToModel(newItem)
        do {
            try context.save()
            print("createItem 성공")
        } catch {
            print("createItem 실패 ㅠㅠ")
        }
    }

    func deleteItem(items item: Model) {
        context.delete(item)
        do {
            try context.save()
            print("deleteItem 성공")
        } catch {
            print("delete 실패")
        }
    }

    func updateItem(item: Model, memo: String)  {
        item.memo = memo
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

