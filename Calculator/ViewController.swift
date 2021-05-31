//
//  ViewController.swift
//  Calculator
//
//  Created by Amben on 5/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperator: Operator = Operator.nothing
    var calcState: CalculationState = CalculationState.enteringNumber
    
    var firstValue: String = ""
    

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberClicked(_ sender: UIButton) {
        updateDisplay (number: String(sender.tag))
    }
    
    func updateDisplay (number: String) {
        if calcState == CalculationState.newNumStarted {
            if let num = resultLabel.text {
                    if num != "" {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNumber
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNumber {
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    @IBAction func operatorsClicked(_ sender: UIButton) {
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel.text {
            if num != "" {
                firstValue = num
                resultLabel.text = ""
            }
        }
        
        updateOperatorButton(tag: sender.tag)
        
        switch sender.tag {
        case 10:
            currentOperator =  Operator.add
        case 11:
            currentOperator =  Operator.subtract
        case 12:
            currentOperator =  Operator.times
        case 13:
            currentOperator =  Operator.divide
        default:
            return
        }
    }
    
    @IBAction func equalsClicked(_ sender: UIButton) {
        calculateSum()
    }
    
    func calculateSum() {
        if (firstValue.isEmpty) {
            return
        }
        
        var result = ""
        if currentOperator == Operator.times {
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperator == Operator.divide {
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperator == Operator.add {
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperator == Operator.subtract {
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }
    
    func updateOperatorButton (tag: Int) {
        //Clear colors
        for i in 10..<14 {
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clear
            }
        }
        //Change button color
        if let button = self.view.viewWithTag(tag) as? UIButton {
            button.backgroundColor = UIColor.red
        }
    }
    
}

