//
//  CalcButton.swift
//  CalculaTHOR
//
//  Created by Ronak Harkhani on 02/04/21.
//

import SwiftUI

enum CalcButton: String {    
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case decimal = "."
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case percent = "%"
    case negative = "-/+"
    case clear = "AC"
    case equal = "="
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return Color(.orange)
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}
