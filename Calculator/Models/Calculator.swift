//
//  Calculator.swift
//  Calculator
//
//  Created by Eslam Fathy on 5/12/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    
    private var twoNumOperation: (num1 :Double , symbol: String )?
    private var number : Double?
    
    mutating func setNumber (n: Double ){
        self.number = n
    }
    
    mutating func prepareCalculation(_ operation: String) -> Double? {
        if var n = number {
            switch operation {
            case "AC":
                n = 0.0
                return n
            case "+/-":
                n *= -1
                return n
            case "%" :
                return n * 0.01
            case "=" :
                return performCalculation(n2 : n)
            default:
                twoNumOperation = (n , operation)
            }
        }
        return nil
    }
    
    
    private func performCalculation(n2 : Double ) -> Double? {
        
        if let n1 = twoNumOperation?.num1 {
            if let symbol = twoNumOperation?.symbol {
                switch symbol {
                case "-":
                    return n1 - n2
                case "+":
                    return n1 + n2
                case "÷":
                    return n1 / n2
                case "×":
                    return n1 * n2
                default:
                    fatalError("The operation passed in does not match any of the cases.")
                }
            }
        }
        
        return nil
    }
}
