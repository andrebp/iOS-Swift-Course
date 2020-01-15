//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by André Brandão  on 14/01/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let title : String
    let answer : String
    
    init(q : String, a : String){
        title = q
        answer = a
    }
}
