//
//  Movies+CoreDataProperties.swift
//  DePelis
//
//  Created by Mario Vargas on 13/11/24.
//
//

import Foundation
import CoreData


extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: Strings.CoreData.entityName)
    }

    @NSManaged public var title: String?
    @NSManaged public var overview: String?
    @NSManaged public var language: String?
    @NSManaged public var poster: Data?
    @NSManaged public var date: String?
    @NSManaged public var rate: Double
    @NSManaged public var backdrop: Data?

}

extension Movies : Identifiable {

}
