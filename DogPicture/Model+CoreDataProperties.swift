//
//  Model+CoreDataProperties.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/03.
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
    @NSManaged public var dogInfo: DogInfo?
    
}

extension Model : Identifiable {

}
