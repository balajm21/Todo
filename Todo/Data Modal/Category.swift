//
//  Category.swift
//  Todo
//
//  Created by Balaji M on 04/08/18.
//  Copyright © 2018 Balaji M. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name : String = ""
    let items = List<Item>()  //forward relationship by automatic
}
