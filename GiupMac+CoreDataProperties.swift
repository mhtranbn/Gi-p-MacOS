//
//  GiupMac+CoreDataProperties.swift
//  Giúp Mac
//
//  Created by mhtran on 1/30/16.
//  Copyright © 2016 mhtran. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension GiupMac {

    @NSManaged var title: String?
    @NSManaged var detail: String?
    @NSManaged var image: String?
    @NSManaged var kindof: String?

}
