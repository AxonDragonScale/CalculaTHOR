//
//  ContentView.swift
//  CalculaTHOR
//
//  Created by Ronak Harkhani on 02/04/21.
//

import SwiftUI

struct ContentView: View {
    @State var value = "0"
    @State var currentOperation: Operation = .none
    @State var runningNumber = 0
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Calculator Display
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                
                // Calculator Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Button(action: {
                                onTap(on: button)
                            }, label: {
                                Text(button.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: buttonWidth(for: button), height: buttonHeight(), alignment: .center)
                                    .background(button.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(buttonHeight()/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func onTap(on button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                currentOperation = .add
            } else if button == .subtract {
                currentOperation = .subtract
            } else if button == .multiply {
                currentOperation = .multiply
            } else if button == .divide {
                currentOperation = .divide
            }
            
            if button != .equal {
                runningNumber = Int(value) ?? 0
                value = "0"
            } else if button == .equal {
                let currentNumber = Int(value) ?? 0
                switch currentOperation {
                case .add: value = "\(runningNumber + currentNumber)"
                case .subtract: value = "\(runningNumber - currentNumber)"
                case .multiply: value = "\(runningNumber * currentNumber)"
                case .divide: value = "\(runningNumber / currentNumber)"
                case .none: break
                }
            }
        case .clear:
            value = "0"
            break
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if value == "0" {
                value = number
            } else {
                value = "\(value)\(number)"
            }
        }
    }
    
    // Padding is 12, Number of padding columns is 4 or 5
    func buttonWidth(for button: CalcButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - (12 * 4)) / 2 + 6
        }
        return (UIScreen.main.bounds.width - (12 * 5)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (12 * 5)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
