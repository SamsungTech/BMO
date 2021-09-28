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

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func getAllItems() -> [Model] {
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
        context.delete(item)
        do {
            try context.save()
            print("deleteItem 성공")
        } catch {
            print("delete 실패")
        }
    }

    func updateItem(item: Model, memo: String) {
        item.memo = memo
        do {
            try context.save()
            print("update 성공")
        } catch {
            print("update 실패 ㅠㅠ")
        }
    }
}
