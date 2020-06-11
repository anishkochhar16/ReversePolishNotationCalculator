//
//  RPNCalculator.swift
//  ReversePolishNotationCalculator
//
//  Created by Anish Kochhar on 11/06/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation

class RPNCalculator {
        
    var expression: [String]
    var stack = Stack()
    var error: String? = nil
        
    // MARK: Initalizers
    init(expression: [String]) {
        self.expression = expression
    }
    
    // MARK: Functions
    func calculate() {
        for term in expression {
            if (term == Operators.addition.rawValue) || (term == Operators.subtraction.rawValue) || (term == Operators.mutliplication.rawValue) || (term == Operators.division.rawValue) {
                // This is an operator. Pop two values off the stack, do the operator, then return to stack
                if stack.stack.count < 2 {
                    // i.e. there are not enough terms, so this is an invalid input. Give an error
                    error = "Error code: 1"
                } else {
                    if let b = Int(stack.pop()) {
                        if let a = Int(stack.pop()) {
                            switch term {
                            case Operators.addition.rawValue:
                                let r = a + b
                                stack.push(term: String(r))
                            case Operators.subtraction.rawValue:
                                let r = a - b
                                stack.push(term: String(r))
                            case Operators.mutliplication.rawValue:
                                let r = a * b
                                stack.push(term: String(r))
                            case Operators.division.rawValue:
                                let r = a / b
                                stack.push(term: String(r))
                            default:
                                fatalError("Invalid operator")
                            }
                        } else { print("Not an integer") }
                    } else { print("Not an integer") }
                    
                }
            } else {
                // Push to stack
                stack.push(term: term)
            }
        }
        if stack.stack.count != 1 {
            // They have entered invalid expression, throw an error.
            error = "Error code: 2"
        }
        print(stack.stack)
    }
}
