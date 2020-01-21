//
//  CalculatorModel.swift
//  BMI Calculator
//
//  Created by André Brandão  on 20/01/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorModel {
    var bmi : BmiModel?

    mutating func calculateBmi(weight : Float, height : Float) {
        let bmiValue = weight / pow(height, 2)
        let advice : String
        let color : UIColor
        switch bmiValue {
            case 0...18.5:
                advice = "Eat more pies"
                color = .blue
            case 18.5...24.9:
                advice = "You're doing great"
                color = .green
            default:
                advice = "Eat less pies"
                color = .red
        }
        bmi = BmiModel(value: bmiValue, advice: advice, color: color)
    }
    
    func getBmi() -> String? {
        if bmi != nil {
            return String(format : "%.1f", bmi!.value)
        }
        return nil
    }
    
    func getColor() -> UIColor? {
        if let safeBmi = bmi {
            return safeBmi.color
        }
        return nil
    }
    
    func getAdvice() -> String? {
        if let safeBmi = bmi {
            return safeBmi.advice
        }
        return nil
    }
}
