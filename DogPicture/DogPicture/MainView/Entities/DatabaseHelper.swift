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
    
    func saveImageInCoredata(at photoData: Data) {
        let model = NSEntityDescription.insertNewObject(forEntityName: "Model", into: context) as! Model
        model.photo = photoData
        do {
            try context.save()
            print("세이브 완료")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getAllImages() -> [Model]{
        var arrModel = [Model]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Model")
        do {
            arrModel = try context.fetch(fetchRequest) as! [Model]
        } catch let error {
            print(error.localizedDescription)
        }
        return arrModel
    }
}
