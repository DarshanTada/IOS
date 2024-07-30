//
//  Person+CoreDataProperties.swift
//  week11
//
//  Created by Admin on 2024-07-23.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var personID: UUID?
    @NSManaged public var hairColor: String?
    @NSManaged public var name: String?
    @NSManaged public var age: String?

}

extension Person : Identifiable {

}
