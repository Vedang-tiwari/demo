//
//  College+CoreDataProperties.swift
//  CoreDataDemo1
//
//  Created by Students on 25/04/24.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?
    @NSManaged public var stuent_rel: NSSet?

}

// MARK: Generated accessors for stuent_rel
extension College {

    @objc(addStuent_relObject:)
    @NSManaged public func addToStuent_rel(_ value: Student)

    @objc(removeStuent_relObject:)
    @NSManaged public func removeFromStuent_rel(_ value: Student)

    @objc(addStuent_rel:)
    @NSManaged public func addToStuent_rel(_ values: NSSet)

    @objc(removeStuent_rel:)
    @NSManaged public func removeFromStuent_rel(_ values: NSSet)

}

extension College : Identifiable {

}
 
