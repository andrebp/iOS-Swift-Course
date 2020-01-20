//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        let value = formatter.string(for: sender.value)!
        //print(formatter.string(for: sender.value)!)
        heightLabel.text = ("\(value)m")
    }
    var calculatorModel = CalculatorModel()
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        //print(Int(sender.value))
        weightLabel.text = ("\(value)Kg")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorModel.calculateBmi(weight: weight, height: height)
        
        //let secondVC = SecondViewController()
        //secondVC.bmiValue = String(format: "%.1f",BMI)
        //self.present(secondVC, animated: true, completion: nil)
       
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            if let bmiString = calculatorModel.getBmi() {
                destinationVC.bmiValue = bmiString
            }
            
            if let bmiAdvice = calculatorModel.getAdvice() {
                destinationVC.bmiAdvice = bmiAdvice
            }
            
            if let bmiColor = calculatorModel.getColor() {
                destinationVC.bmiColor = bmiColor
            }
        }
        
    }
}

