//
//  StructsEnums.swift
//  Calculator
//
//  Created by Amben on 5/29/21.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNumber = "enteringNumber"
    case newNumStarted = "newNumStarted"
}
