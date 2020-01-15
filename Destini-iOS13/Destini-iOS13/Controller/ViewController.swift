//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
       
    @IBAction func choicePressed(_ sender: UIButton) {
        
        storyBrain.nextStory((sender.titleLabel?.text!)!)
        
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        choice1Button.tag = 1
        choice2Button.tag = 2
        
        updateUI()
    }

    func updateUI(){
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.getStoryChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getStoryChoice2(), for: .normal)
    }

}

