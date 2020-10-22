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
        //print("\(digit) was used")
        if userIsInTheMiddleOfTyping {
            let currentDisplay = display.text
            display.text = currentDisplay! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        if let mathematicalSymbol = sender.currentTitle {
            switch  mathematicalSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                let operand = displayValue
                displayValue = sqrt(operand)
            default:
                break
            }
        }
        userIsInTheMiddleOfTyping = false
    }
    
}

