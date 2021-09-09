//
//  MemoContent+CoreDataProperties.swift
//  
//
//  Created by 김동우 on 2021/06/28.
//
//

import Foundation
import CoreData


extension MemoContent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoContent> {
        return NSFetchRequest<MemoContent>(entityName: "MemoContent")
    }
    
    
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var createAt: Date?
}

extension MemoContent : Identifiable {
    
}
