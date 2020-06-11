//
//  Stack.swift
//  ReversePolishNotationCalculator
//
//  Created by Anish Kochhar on 11/06/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation

class Stack {
    
    var stack = [String]()
    
    func pop() -> String {
        if stack.count > 0 {
            return stack.popLast()!
        }
        else {
            return ""
        }
    }
    
    func push(term: String) {
        stack.append(term)
    }
    
}
