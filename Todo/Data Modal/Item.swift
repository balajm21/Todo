//
//  Item.swift
//  Todo
//
//  Created by Balaji M on 04/08/18.
//  Copyright © 2018 Balaji M. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")    // inverse relationship
    
}
