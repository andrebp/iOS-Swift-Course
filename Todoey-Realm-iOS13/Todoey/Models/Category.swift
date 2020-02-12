//
//  Category.swift
//  Todoey
//
//  Created by André Brandão  on 12/02/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
