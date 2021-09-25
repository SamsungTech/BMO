//
//  MemoViewInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit
import CoreData

class MemoViewInteracter: MemoViewInteracterInputProtocol {
    weak var presenter: MemoViewInteracterOutputProtocol?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // CoreData
    
    func getAllItems() {
        do {
//            let items = try context.fetch(MemoContent.fetchRequest())
        }
        catch {
            // error
        }
    }
    
    
}

extension MemoViewInteracter: MemoViewInteracterOutputProtocol {
    func createItem(title: String, content: String) {
//        let newItem = MemoContent(context: context)
//        newItem.content = content
//        newItem.title = title
//        newItem.createAt = Date()
        do {
            try context.save()
        }
        catch {
            
        }
    }
    
    
    
//    func updateItem(item: MemoContent, newTitle: String) {
//        item.title = newTitle
//        do {
//            try context.save()
//        }
//        catch {
//
//        }
//    }
    
    
}
