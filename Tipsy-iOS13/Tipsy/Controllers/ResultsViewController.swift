//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by André Brandão  on 21/01/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var valueForEachPerson : String?
    var descriptionText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = valueForEachPerson
        settingsLabel.text = descriptionText
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
