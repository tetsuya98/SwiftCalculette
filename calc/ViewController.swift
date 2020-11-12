//
//  ViewController.swift
//  calc
//
//  Created by Josselin on 22/10/2020.
//  Copyright © 2020 Josselin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Interface Components
    @IBOutlet weak var display: UILabel!

    //Variables
    private var brain = calculatorBrain()
    var userIsInTheMiddleOfTyping: Bool = false
    var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let currentDisplay = display.text
            display.text = currentDisplay! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
    
}

