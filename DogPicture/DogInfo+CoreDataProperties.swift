//
//  DogInfo+CoreDataProperties.swift
//  
//
//  Created by 김동우 on 2021/10/06.
//
//

import Foundation
import CoreData


extension DogInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DogInfo> {
        return NSFetchRequest<DogInfo>(entityName: "DogInfo")
    }

    @NSManaged public var dogName: String?
    @NSManaged public var dogBirthday: Date?
    @NSManaged public var dogGender: Bool
    @NSManaged public var dogWeight: Double
    @NSManaged public var dogType: Int16
    @NSManaged public var neutering: Bool
    @NSManaged public var userName: String?

}
