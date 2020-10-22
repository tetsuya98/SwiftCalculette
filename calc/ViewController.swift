//
//  ViewController.swift
//  calc
//
//  Created by Josselin on 22/10/2020.
//  Copyright © 2020 Josselin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTyping: Bool = false
    @IBOutlet weak var display: UILabel!

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        //print("\(digit) was used")
        if userIsInTheMiddleOfTyping {
            let currentDisplay = display!.text
            display?.text = currentDisplay! + digit
        }else{
            display!.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        if let mathematicalSymbol = sender.currentTitle {
            switch  mathematicalSymbol {
            case "π":
                display!.text = String(Double.pi)
            case "√":
                let operand = Double(display!.text!)
                display!.text = String(sqrt(operand!))
            default:
                break
            }
        }
        userIsInTheMiddleOfTyping = false
    }
    
}

