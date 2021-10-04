//
//  Model+CoreDataProperties.swift
//  
//
//  Created by 김동우 on 2021/10/04.
//
//

import Foundation
import CoreData


extension Model {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Model> {
        return NSFetchRequest<Model>(entityName: "Model")
    }

    @NSManaged public var date: Date?
    @NSManaged public var memo: String?
    @NSManaged public var photo: Data?

}
