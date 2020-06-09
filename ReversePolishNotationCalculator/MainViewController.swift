//
//  ViewController.swift
//  ReversePolishNotationCalculator
//
//  Created by Anish Kochhar on 09/06/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var mainTextField: UITextView!
    
    // MARK: Properties
    var currentExpression = [String]()
    var currentWord = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Clear the display
        mainTextField.text = ""
        
    }
    
    // MARK: Functions
    func addDigit(digit: String) {
        mainTextField.text += digit
        currentWord += digit
    }
    
    func validateInput() -> Bool {
        var valid = false
        // If it can be made into an integer
        if let integer = Int(currentWord) {
            if integer < 999 && integer > -999 {
                valid = true
            }
        }
        if !valid {
            // Alert controller or whatever
            print("invalid")
        }
        return valid
    }
    
    func addOperator(operator_name: String) {
        if currentWord != "" {
            // They have not finished entering the previous operand, show an AC
            print("Unifisnied")
        }
        else {
            // Add the plus as normal
            currentExpression.append(operator_name)
            mainTextField.text += operator_name + " "
        }
    }

    
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
    
    @IBAction func flipSign(_ sender: Any) {
    }
    
    @IBAction func evaluate(_ sender: Any) {
    }
    
    @IBAction func clear(_ sender: Any) {
        mainTextField.text = ""
        currentWord = ""
        currentExpression = [String]()
    }
    
    @IBAction func enter(_ sender: Any) {
        // They want to end the current character, so add it to the array of operands and opcodes.
        // First, validate the input is a three digit integer
        if validateInput() {
            currentExpression.append(currentWord)
            currentWord = ""
            mainTextField.text += " "
        }
        print(currentExpression)
        
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

