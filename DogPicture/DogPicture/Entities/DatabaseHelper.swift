//
//  DatabaseHelper.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/19.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper {
    static let instance = DatabaseHelper()

    func getAllItems() -> [Model] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var models = [Model]()
        do {
            models = try context.fetch(Model.fetchRequest())
            print("가져오기 성공!")
        } catch {
            print("models 가져오기 실패")
        }
        return models
    }

    func createItem(photo: Data, memo: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newItem = Model(context: context)
        newItem.photo = photo
        newItem.memo = memo
        newItem.date = Date()

        do {
            try context.save()
            print("createItem 성공")
        } catch {
            print("createItem 실패 ㅠㅠ")
        }
    }

    func deleteItem(item: Model) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(item)
        do {
            try context.save()
            print("deleteItem 성공")
        } catch {
            print("delete 실패")
        }
    }

    func updateItem(item: Model, memo: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        item.memo = memo
        do {
            try context.save()
            print("update 성공")
        } catch {
            print("update 실패 ㅠㅠ")
        }
    }
    
//    let persistentContainer: NSPersistentContainer
//
//    init() {
//        persistentContainer = NSPersistentContainer(name: "DogPicture")
//        persistentContainer.loadPersistentStores { (NSEntityDescription, Error) in
//            if let Error = Error {
//                fatalError("Cora Data Store failed \(Error.localizedDescription)")
//            }
//        }
//    }
//
//    func getAllItems() -> [Model] {
//        let fetchRequest: NSFetchRequest<Model> = Model.fetchRequest()
//
//        do {
//            return try persistentContainer.viewContext.fetch(fetchRequest)
//            print("getAllItems 성공!")
//        } catch {
//            return []
//            print("getAllItems 실패 ㅜㅜ")
//        }
//    }
//
//    func createItem(photo: Data, memo: String) {
//        let model = Model(context: persistentContainer.viewContext)
//        model.photo = photo
//        model.memo = memo
//        model.date = Date()
//
//        do {
//            try persistentContainer.viewContext.save()
//            print("coredata save 성공!")
//        } catch {
//            print("Failed Save Data\(error)")
//        }
//    }
//
//    func deleteItem(item: Model) {
//        persistentContainer.viewContext.delete(item)
//
//        do {
//            try persistentContainer.viewContext.save()
//            print("cora data delete 성공!")
//        } catch {
//            persistentContainer.viewContext.rollback()
//            print("Failed to save context \(error)")
//        }
//    }
//
//    func updateItem(item: Model, memo: String) {
//        do {
//            try persistentContainer.viewContext.save()
//            print("cora data update 성공!")
//        } catch {
//            persistentContainer.viewContext.rollback()
//            print("Failed to update context \(error)")
//        }
//    }
}
