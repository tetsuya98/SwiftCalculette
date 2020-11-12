//
//  CalculatorBrain.swift
//  calc
//
//  Created by Josselin on 12/11/2020.
//  Copyright © 2020 Josselin. All rights reserved.
//

import Foundation

func changeSign(_ value: Double) -> Double {
    return -value
}

func add(op1: Double, op2: Double) -> Double {
    return op1 + op2
}

func sub(op1: Double, op2: Double) -> Double {
    return op1 - op2
}

func div(op1: Double, op2: Double) -> Double {
    return op1 / op2
}

func mul(op1: Double, op2: Double) -> Double {
    return op1 * op2
}

struct calculatorBrain {
    private var accumulator: Double?
    
    private enum Operations {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String, Operations> = [
        "π": Operations.constant(Double.pi),
        "√": Operations.unaryOperation(sqrt),
        "cos": Operations.unaryOperation(cos),
        "sin": Operations.unaryOperation(sin),
        "tan": Operations.unaryOperation(tan),
        "±": Operations.unaryOperation(changeSign),
        "+": Operations.binaryOperation(add),
        "-": Operations.binaryOperation(sub),
        "÷": Operations.binaryOperation(div),
        "x": Operations.binaryOperation(mul),
        "=": Operations.equals
    ]
    
    var result: Double? {
        get{return accumulator}
    }
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        func perform (with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    private var pbo: PendingBinaryOperation?
    
    mutating func performOperation(_ symbol: String){
        if let operation = operations[symbol] {
            switch operation {
                case .constant(let value):
                    accumulator = value
                case .unaryOperation(let function):
                    accumulator = function(accumulator!)
                case .binaryOperation(let function):
                    if accumulator != nil {
                        pbo = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    }
                case .equals:
                    if pbo != nil && accumulator != nil {
                        accumulator = pbo!.perform(with: accumulator!)
                }
            }
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
}
