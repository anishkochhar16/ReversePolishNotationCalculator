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
    var flipper = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Clear the display
        mainTextField.text = ""
    }
    
    // MARK: Functions
    func addDigit(digit: String) {
        let stringOfExpressions = currentExpression.joined(separator: " ")
        currentWord += digit
        mainTextField.text = stringOfExpressions + " " + currentWord
    }
    
    func validateInput() -> Bool {
        var valid = false
        // If it can be made into an integer
        if let integer = Int(currentWord) {
            if integer < 999 && integer > -999 {
                valid = true
            }
        }
        return valid
    }
    
    func endOperand() {
        if validateInput() {
            // Coverting to Int removes leading zeros. This can be forced unwrapped as we already validated its an int.
            currentExpression.append("\(Int(currentWord)!)")
            currentWord = ""
            mainTextField.text += " "
            print(currentExpression)
        } else {
            invalidInput(message: "Either you have entered too big a number, or no number at all.")
        }
    }
    
    func addOperator(operator_name: String) {
        if currentWord != "" {
            // They have not finished entering the previous operand, so end it for them
            endOperand()
        }
        // Add the operator as normal
        switch operator_name {
        case "+":
            currentExpression.append(Operators.addition.rawValue)
            mainTextField.text += Operators.addition.rawValue + " "
        case "-":
            currentExpression.append(Operators.subtraction.rawValue)
            mainTextField.text += Operators.subtraction.rawValue + " "
        case "*":
            currentExpression.append(Operators.mutliplication.rawValue)
            mainTextField.text += Operators.mutliplication.rawValue + " "
        case "/":
            currentExpression.append(Operators.division.rawValue)
            mainTextField.text += Operators.division.rawValue + " "
        default:
            fatalError("Invalid operator sent")
        }
    }
    
    func clearEverything() {
        currentExpression = [String]()
        currentWord = ""
        mainTextField.text = ""
    }
    
    func invalidInput(message: String) {
        let ac = UIAlertController(title: "Invalid Input", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    // I have put all the IBAction code in the extension file in order to reduce number of lines in this one file
}
