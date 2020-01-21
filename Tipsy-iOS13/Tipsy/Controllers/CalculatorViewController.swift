//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorModel = CalculatorModel()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        switch sender {
        case zeroPctButton:
            //zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case tenPctButton:
            zeroPctButton.isSelected = false
            //tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            //twentyPctButton.isSelected = true
        }
        sender.isSelected = true
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var tipAmount : Float = 0
        if zeroPctButton.isSelected {
            tipAmount = 0
        }
        if tenPctButton.isSelected {
            tipAmount = 0.1
        }
        if twentyPctButton.isSelected {
            tipAmount = 0.2
        }
        calculatorModel.tipAmount = tipAmount
        calculatorModel.billTotal = Float(billTextField.text!)!
       
        let numberOfPersons = Float(splitNumberLabel.text!)!
       
        calculatorModel.calculateValue(numberOfPersons: numberOfPersons)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.valueForEachPerson = String(calculatorModel.valueToPay)
            destinationVC.descriptionText = "Split between \(splitNumberLabel.text!) people, with \(Int(calculatorModel.tipAmount * 100))% tip."
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
}

