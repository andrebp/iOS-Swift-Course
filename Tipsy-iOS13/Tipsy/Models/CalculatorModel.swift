//
//  CalculatorModel.swift
//  Tipsy
//
//  Created by André Brandão  on 21/01/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorModel {
    var tipAmount : Float = 0
    var valueToPay : Float = 0
    var billTotal : Float = 0
    
    mutating func calculateValue(numberOfPersons : Float) {
        let valueDivided = billTotal / numberOfPersons
        let tipPercentage = valueDivided * tipAmount
        valueToPay = valueDivided + tipPercentage
    }
}
