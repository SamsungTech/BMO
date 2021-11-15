//
//  DogInfo+CoreDataProperties.swift
//  DogPicture
//
//  Created by 김동우 on 2021/11/03.
//
//

import Foundation
import CoreData


extension DogInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DogInfo> {
        return NSFetchRequest<DogInfo>(entityName: "DogInfo")
    }

    @NSManaged public var dogBirthday: Date?
    @NSManaged public var dogGender: Bool
    @NSManaged public var dogImage: Data?
    @NSManaged public var dogName: String?
    @NSManaged public var dogType: String?
    @NSManaged public var dogWeight: Double
    @NSManaged public var neutering: Bool
    @NSManaged public var userName: String?
    @NSManaged public var dogRelation: String?
    @NSManaged public var model: Set<Model>?

}

// MARK: Generated accessors for model
extension DogInfo {

    @objc(addModelObject:)
    @NSManaged public func addToModel(_ value: Model)

    @objc(removeModelObject:)
    @NSManaged public func removeFromModel(_ value: Model)

    @objc(addModel:)
    @NSManaged public func addToModel(_ values: NSSet)

    @objc(removeModel:)
    @NSManaged public func removeFromModel(_ values: NSSet)

}

extension DogInfo : Identifiable {

}
