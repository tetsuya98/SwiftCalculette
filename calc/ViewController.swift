//
//  ViewController.swift
//  calc
//
//  Created by Josselin on 22/10/2020.
//  Copyright © 2020 Josselin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("\(digit) was used")
    }
}

