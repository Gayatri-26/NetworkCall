//
//  Countries+CoreDataProperties.swift
//  Json Parsing 2
//
//  Created by Mac on 09/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//
//

import Foundation
import CoreData


extension Countries {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Countries> {
        return NSFetchRequest<Countries>(entityName: "Countries")
    }

    @NSManaged public var name: String?
    @NSManaged public var capital: String?

}
