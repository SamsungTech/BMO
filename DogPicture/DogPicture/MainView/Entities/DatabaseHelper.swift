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
    
//    static let instance = DatabaseHelper()
//
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//
//    func saveImageInCoredata(photo: Data, date: Date, memo: String) {
//        let model = NSEntityDescription.insertNewObject(forEntityName: "Model", into: context) as! Model
//        model.photo = photo
//        model.date = date
//        model.memo = memo
//        do {
//            try context.save()
//            print("세이브 완료")
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
//
//
//    // update 미완
//    func updateData(photo: Data, date: Date, memo: String) {
//        let model = NSEntityDescription.entity(forEntityName: "Model", in: context) as! Model
//        let filter = filteredDataLocationRequest(photo: photo)
//        do {
//            let datas = try context.fetch(filter) as! [NSManagedObject]
//            let cell: Model! = nil
//            if ㅇㅁㅅ {
//                cell = datas.first as? Model
//                cell.photo = photo
//                cell.date = date
//                cell.memo = memo
//            } else {
//                print("updateData 실행 실패")
//            }
//            print("셀 찾기 & 설정")
//        } catch {
//            print("같은 셀 찾기 실패")
//        }
//        do {
//            try context.save()
//        } catch {
//            print("업데이트 실패")
//        }
//    }
//
//    func deleteDataLocation(photo: Data) {
//        let deleteRequest: NSFetchRequest<NSFetchRequestResult> = filteredDataLocationRequest(photo: photo)
//        do {
//            if let result: [Model] = try context.fetch(deleteRequest) as? [Model] {
//                if result.count != 0 {
//                    context.delete(result[0])
//                }
//            }
//        } catch let error as NSError {
//            print("fatch가 안됨: \(error), \(error.userInfo)")
//        }
//        do {
//            try context.save()
//            print("코어 데이터 삭제 성공")
//        } catch {
//            context.rollback()
//            print("코어 데이터 삭제 save 실행 불가능")
//        }
//    }
//
//    fileprivate func filteredDataLocationRequest(photo: Data) -> NSFetchRequest<NSFetchRequestResult> {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Model")
//        fetchRequest.predicate = NSPredicate(format: "photo = %@", "\(photo)")
//        return fetchRequest
//    }
    
    func getAllItems() -> [Model] {
        var models = [Model]()
        do {
            models = try context.fetch(Model.fetchRequest())
        } catch {
            print("models 가져오기 실패")
        }
        return models
    }
    
    // 각 func을 불러온 후 reloaddata 가 필요
    func createItem(photo: Data, memo: String) {
        let newItem = Model(context: context)
        newItem.photo = photo
        newItem.memo = memo
        newItem.date = Date()
        
        do {
            try context.save()
            print("세이브 성공!")
        } catch {
            print("세이브 실패!")
        }
    }
    
    func deleteItem(item: Model) {
        context.delete(item)
        do {
            try context.save()
            print("삭제 성공")
        } catch {
            print("삭제 실패")
        }
    }
    
    func updateItem(item: Model, memo: String) {
        item.memo = memo
        do {
            try context.save()
            print("업데이트 성공")
        } catch {
            print("업데이트 실패")
        }
    }
}
