//
//  HP.swift
//  nakama-ios
//
//  Created by Stephen Wong on 1/24/16.
//  Copyright © 2016 Nakama Project. All rights reserved.
//

import CoreData

class HP: NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var hp: NSNumber?
}
