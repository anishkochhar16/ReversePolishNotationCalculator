//
//  MainViewControllerExtension.swift
//  ReversePolishNotationCalculator
//
//  Created by Anish Kochhar on 11/06/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

extension MainViewController {
    
    // MARK: Calculator buttons
    @IBAction func one(_ sender: Any) {
        addDigit(digit: "1")
    }
    @IBAction func two(_ sender: Any) {
        addDigit(digit: "2")
    }
    @IBAction func three(_ sender: Any) {
        addDigit(digit: "3")
    }
    @IBAction func four(_ sender: Any) {
        addDigit(digit: "4")
    }
    @IBAction func five(_ sender: Any) {
        addDigit(digit: "5")
    }
    @IBAction func six(_ sender: Any) {
        addDigit(digit: "6")
    }
    @IBAction func seven(_ sender: Any) {
        addDigit(digit: "7")
    }
    @IBAction func eight(_ sender: Any) {
        addDigit(digit: "8")
    }
    @IBAction func nine(_ sender: Any) {
        addDigit(digit: "9")
    }
    @IBAction func zero(_ sender: Any) {
        addDigit(digit: "0")
    }
    
    // 
    @IBAction func flipSign(_ sender: Any) {
        if validateInput() {
            currentWord = String(Int(currentWord)! * -1)
            // Update Display
            addDigit(digit: "")
        }
        else {
            // Alert Controller. Not an int, so can't flip sign
        }
    }
    
    // MARK: Evaluate
    @IBAction func evaluate(_ sender: Any) {
        print(currentExpression)
        let calculator = RPNCalculator(expression: currentExpression)
        calculator.calculate()
        
        if calculator.error == nil {
            // Everything has gone fine, update the display to the answer
            let answer = calculator.stack.stack[0]
            currentWord = ""
            currentExpression = [answer]
            mainTextField.text = answer
        } else {
            invalidInput(message: "You have entered an invalid expression")
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        clearEverything()
    }
    
    @IBAction func enter(_ sender: Any) {
        // They want to end the current character, so add it to the array of operands and opcodes.
        endOperand()
    }
    
    @IBAction func plus(_ sender: Any) {
        addOperator(operator_name: "+")
    }
    @IBAction func minus(_ sender: Any) {
        addOperator(operator_name: "-")
    }
    @IBAction func times(_ sender: Any) {
        addOperator(operator_name: "*")
    }
    @IBAction func divide(_ sender: Any) {
        addOperator(operator_name: "/")
    }
    
    
}
