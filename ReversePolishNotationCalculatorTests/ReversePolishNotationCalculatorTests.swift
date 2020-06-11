//
//  ReversePolishNotationCalculatorTests.swift
//  ReversePolishNotationCalculatorTests
//
//  Created by Anish Kochhar on 09/06/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import XCTest
@testable import ReversePolishNotationCalculator

class ReversePolishNotationCalculatorTests: XCTestCase {

    // All of these tests test that the calculator functions as expected
    
    func testAddition() {
        let calc = RPNCalculator(expression: ["4", "11", "+", "30", "+"])
        calc.calculate()
        // assert
        XCTAssertEqual("45", calc.stack.stack[0])
        XCTAssertNil(calc.error)
    }
    
    func testRepeatedAddition() {
        let calc = RPNCalculator(expression: ["49", "21", "24", "90", "-2", "34", "+", "+", "+", "+", "+"])
        calc.calculate()
        // assert
        XCTAssertEqual("216", calc.stack.stack[0])
        XCTAssertNil(calc.error)
    }
    
    func testMultiplication() {
        let calc = RPNCalculator(expression: ["523", "5", "91", "*", "*"])
        calc.calculate()
        // assert
        XCTAssertEqual("237965", calc.stack.stack[0])
        XCTAssertNil(calc.error)
    }
    
    func testSubtractionAndAddition() {
        let calc = RPNCalculator(expression: ["49", "21", "999", "+", "-21", "-", "-"])
        calc.calculate()
        // assert
        XCTAssertEqual("-992", calc.stack.stack[0])
        XCTAssertNil(calc.error)
    }
    
    func testMultilpicationWithNegativeNumbers() {
        let calc = RPNCalculator(expression: ["-63", "-413", "*", "-21", "*"])
        calc.calculate()
        // assert
        XCTAssertEqual("-546399", calc.stack.stack[0])
        XCTAssertNil(calc.error)
    }
    
    func testDivision() {
        let calc = RPNCalculator(expression: ["52", "24", "/"])
        calc.calculate()
        // assert
        XCTAssertEqual("2", calc.stack.stack[0])
        XCTAssertNil(calc.error)
    }
    
    func divisionWithNegativeNumbers() {
        let calc = RPNCalculator(expression: ["435", "-21", "/"])
        calc.calculate()
        // assert
        XCTAssertEqual("-20", calc.stack.stack[0])
        XCTAssertNil(calc.error)
    }
    
    // Tests to check what happens with invalid input expression
    
    func testErrorWhenTooManyOperators() {
        let calc = RPNCalculator(expression: ["41", "21", "21", "+", "+", "+"])
        calc.calculate()
        // assert
        XCTAssertNotNil(calc.error)
    }
    
    func testErrorWhenTooFewOperators() {
        let calc = RPNCalculator(expression: ["49", "21", "24", "90", "2", "34", "*", "+", "+"])
        calc.calculate()
        // assert
        XCTAssertNotNil(calc.error)
    }

}
