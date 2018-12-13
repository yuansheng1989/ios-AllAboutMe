//
//  ViewController.swift
//  AllAboutMe
//
//  Created by Yuansheng Lu on 2018-09-21.
//  Copyright © 2018 Yuansheng Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Local Fileds
    
    func updateResultText() {
        let program = programSelector.selectedSegmentIndex == 0 ? "CPA" : "BSD"
        let level = String(Int(levelSelector.selectedSegmentIndex) + 4)
        let gpa = String(format: "%1.2f", gpaSelector.value)
        resultText.text = "I am in the \(program) program, in level \(level), and my GPA is \(gpa)."
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // add code to do things, if necessary
        
        return textField.resignFirstResponder()
    }
    
    // Outlets
    @IBOutlet weak var resultText: UITextView!
    @IBOutlet weak var programSelector: UISegmentedControl!
    @IBOutlet weak var levelSelector: UISegmentedControl!
    @IBOutlet weak var gpaSelector: UISlider!
    @IBOutlet weak var gpaInput: UITextField!
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        programSelector.selectedSegmentIndex = 0
        levelSelector.selectedSegmentIndex = 1
        gpaSelector.value = 3.96
        if (programSelector.selectedSegmentIndex) == 0  {
            if (levelSelector.selectedSegmentIndex >= 3) {
                levelSelector.selectedSegmentIndex = 2
            }
            levelSelector.setEnabled(false, forSegmentAt: 3)
            levelSelector.setEnabled(false, forSegmentAt: 4)
        } else {
            levelSelector.setEnabled(true, forSegmentAt: 3)
            levelSelector.setEnabled(true, forSegmentAt: 4)
        }
        updateResultText()
        gpaInput.text = String(format: "%1.2f", gpaSelector.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Actions
    @IBAction func programChanged(_ sender: UISegmentedControl) {
        print("program changed")
        if (programSelector.selectedSegmentIndex) == 0  {
            if (levelSelector.selectedSegmentIndex >= 3) {
                levelSelector.selectedSegmentIndex = 2
            }
            levelSelector.setEnabled(false, forSegmentAt: 3)
            levelSelector.setEnabled(false, forSegmentAt: 4)
        } else {
            levelSelector.setEnabled(true, forSegmentAt: 3)
            levelSelector.setEnabled(true, forSegmentAt: 4)
        }
        updateResultText()
    }
    @IBAction func levelChanged(_ sender: UISegmentedControl) {
        print("level changed")
        updateResultText()
    }
    @IBAction func gpaSelectorChanged(_ sender: UISlider) {
        print("gpa slider changed")
        updateResultText()
        gpaInput.text = String(format: "%1.2f", gpaSelector.value)
    }
    @IBAction func gpaInputChanged(_ sender: UITextField) {
        print("gpa input changed")
        gpaSelector.value = (gpaInput.text! as NSString).floatValue
        if (gpaSelector.value < 2.0) {
            gpaSelector.value = 2.0
        } else if (gpaSelector.value > 4.0) {
            gpaSelector.value = 4.0
        }
        updateResultText()
    }
    
}

