//
//  OperatorAndOperand.swift
//  ReversePolishNotationCalculator
//
//  Created by Anish Kochhar on 11/06/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation

enum Operators: String {
    case addition = "+"
    case subtraction = "-"
    case mutliplication = "*"
    case division = "/"
}

struct Operand {
    var number: Int
    
}
