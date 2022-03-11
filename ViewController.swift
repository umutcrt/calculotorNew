//
//  ViewController.swift
//  calculatorNew
//
//  Created by Umut Cörüt on 8.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var digitLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultEqual: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        digitLabel.text = "0"
        resultLabel.text = "0"
        digitLabel?.layer.cornerRadius = 40
        digitLabel?.layer.masksToBounds = true
        resultLabel?.layer.cornerRadius = 23
        resultLabel?.layer.masksToBounds = true
        resultEqual?.layer.cornerRadius = 23
        resultEqual?.layer.masksToBounds = true
        
    }
    func buttonProcess(digit: String) {
        if digitLabel.text == "0" {
            digitLabel.text = ""
        }
        digitLabel.text! += digit
    }
    @IBAction func button1(_ sender: Any) {
        if resultLabel.text == "ERROR" {}else {
            buttonProcess(digit: "1")}
    }
    @IBAction func button2(_ sender: Any) {
        if resultLabel.text == "ERROR" {}else {
            buttonProcess(digit: "2")}
    }
    @IBAction func button3(_ sender: Any) {
        if resultLabel.text == "ERROR" {}else {
            buttonProcess(digit: "3")}
    }
    @IBAction func button4(_ sender: Any) {
        if resultLabel.text == "ERROR" {}else {
            buttonProcess(digit: "4")}
    }
    @IBAction func button5(_ sender: Any) {
        if resultLabel.text == "ERROR" {}else {
            buttonProcess(digit: "5")}
    }
    @IBAction func button6(_ sender: Any) {
        if resultLabel.text == "ERROR" {}else {
            buttonProcess(digit: "6")}
    }
    @IBAction func button7(_ sender: Any) {
        if resultLabel.text == "ERROR" {}else {
            buttonProcess(digit: "7")}
    }
    @IBAction func button8(_ sender: Any) {
        if resultLabel.text == "ERROR" {}else {
            buttonProcess(digit: "8")}
    }
    @IBAction func button9(_ sender: Any) {
        if resultLabel.text == "ERROR" {}else {
            buttonProcess(digit: "9")}
    }
    @IBAction func button0(_ sender: Any) {
        if resultLabel.text == "ERROR" {}else {
            buttonProcess(digit: "0")}
    }
    @IBAction func buttonDot(_ sender: Any) {
        if digitLabel.text!.hasSuffix("+") || digitLabel.text!.hasSuffix("-") || digitLabel.text!.hasSuffix("x") || digitLabel.text!.hasSuffix("/") || digitLabel.text!.hasSuffix(".") || digitLabel.text!.hasSuffix("(") || digitLabel.text!.hasSuffix(")") || digitLabel.text! == "" || resultLabel.text == "ERROR"{
        } else {
            digitLabel.text! += "."
        }
    }
    var paranthesesLeftCount = 0
    var paranthesesRightCount = 0
    @IBAction func parenthesesLeft(_ sender: Any) {
        
        if digitLabel.text!.count > 1 {
        
        
            if digitLabel.text!.hasSuffix(".") || digitLabel.text!.hasSuffix("1") || digitLabel.text!.hasSuffix("2") || digitLabel.text!.hasSuffix("3") || digitLabel.text!.hasSuffix("4") || digitLabel.text!.hasSuffix("5") || digitLabel.text!.hasSuffix("6") || digitLabel.text!.hasSuffix("7") || digitLabel.text!.hasSuffix("8") || digitLabel.text!.hasSuffix("9") || digitLabel.text!.hasSuffix("0") && digitLabel.text != "0" || digitLabel.text![digitLabel.text!.index(digitLabel.text!.startIndex, offsetBy: digitLabel.text!.count-2)] == "(" || resultLabel.text == "ERROR" {
            
            } else {
                buttonProcess(digit: "(")
                paranthesesLeftCount += 1
            }
        }
        else if digitLabel.text!.hasSuffix(".") || digitLabel.text!.hasSuffix("1") || digitLabel.text!.hasSuffix("2") || digitLabel.text!.hasSuffix("3") || digitLabel.text!.hasSuffix("4") || digitLabel.text!.hasSuffix("5") || digitLabel.text!.hasSuffix("6") || digitLabel.text!.hasSuffix("7") || digitLabel.text!.hasSuffix("8") || digitLabel.text!.hasSuffix("9") || digitLabel.text!.hasSuffix("0") && digitLabel.text != "0" || resultLabel.text == "ERROR"{
        } else {
            buttonProcess(digit: "(")
            paranthesesLeftCount += 1
        }
    }
    @IBAction func parenthesesRight(_ sender: Any) {
        if paranthesesLeftCount <= paranthesesRightCount || digitLabel.text!.hasSuffix("(") || digitLabel.text!.hasSuffix(".") || digitLabel.text![digitLabel.text!.index(digitLabel.text!.startIndex, offsetBy: digitLabel.text!.count-2)] == "(" || digitLabel.text![digitLabel.text!.index(digitLabel.text!.startIndex, offsetBy: digitLabel.text!.count-2)] == ")" || resultLabel.text == "ERROR"{} else {
            buttonProcess(digit: ")")
            paranthesesRightCount += 1
        }
    }
    func adjusting(process: String) {
        if digitLabel.text!.hasSuffix("+") || digitLabel.text!.hasSuffix("-") || digitLabel.text!.hasSuffix("x") || digitLabel.text!.hasSuffix("/") || digitLabel.text!.hasSuffix(".") || digitLabel.text!.hasSuffix("(") {
        } else {
            if resultLabel.text != "0" {
                if digitLabel.text == "0" {
                digitLabel.text = ""
                digitLabel.text! += resultLabel.text!
                }
            }
            if !digitLabel.text!.hasSuffix(")") && !digitLabel.text!.contains(".") {
                digitLabel.text! += ".0"
            }
            digitLabel.text! += process
        }
    }
    @IBAction func buttonPlus(_ sender: Any) {
        if resultLabel.text == "ERROR" {
        } else {
            adjusting(process: "+") }
    }
    @IBAction func buttonMinus(_ sender: Any) {
        if resultLabel.text == "ERROR" {
        } else {
            if digitLabel.text! == "0" {
            digitLabel.text! = ""
            }
            adjusting(process: "-") }
    }
    @IBAction func buttonX(_ sender: Any) {
        if resultLabel.text == "ERROR" {
        }
        if digitLabel.text! == "0" && resultLabel.text! == "0" {}
        else {
            adjusting(process: "x")
        }
    }
    @IBAction func buttonSlash(_ sender: Any) {
        if resultLabel.text == "ERROR" {
        }
        if digitLabel.text! == "0" && resultLabel.text! == "0" {}
        else {
            adjusting(process: "/")
        }
    }
    @IBAction func buttonClear(_ sender: Any) {
        digitLabel.text! = "0"
        resultLabel.text! = "0"
        paranthesesLeftCount = 0
        paranthesesRightCount = 0
    }
    @IBAction func buttonNegative(_ sender: Any) {
        if resultLabel.text == "ERROR" {
        }else {
        if !(resultLabel.text!.hasPrefix("-")) {
            resultLabel.text! = "-" + resultLabel.text!
        } else {
            resultLabel.text!.remove(at: resultLabel.text!.startIndex)
        }
        }
    }
    @IBAction func resultGet(_ sender: Any) {
        if resultLabel.text == "ERROR" {
        } else {
        if digitLabel.text!.hasSuffix("+") || digitLabel.text!.hasSuffix("-") || digitLabel.text!.hasSuffix("x") || digitLabel.text!.hasSuffix("/") || digitLabel.text!.hasSuffix("(") || digitLabel.text!.hasSuffix(")") {
            digitLabel.text! += resultLabel.text!
        } else {}
        }
    }
    @IBAction func buttonDelete(_ sender: Any) {
        if resultLabel.text == "ERROR" {
        } else {
        
        if digitLabel.text!.hasSuffix("(") {
            paranthesesLeftCount -= 1
        }
        if digitLabel.text!.hasSuffix(")") {
            paranthesesRightCount -= 1
        }
        if digitLabel.text!.count == 1 {
            digitLabel.text! = "0"
        }
        else if digitLabel.text! == "" {
            digitLabel.text! += "0"
        }
        else if digitLabel.text! == "0"{
        } else {
            digitLabel.text!.removeLast()
        }
        }
    }
    @IBAction func buttonEqual(_ sender: Any) {
        if digitLabel.text!.hasSuffix("+") || digitLabel.text!.hasSuffix("-") || digitLabel.text!.hasSuffix("x") || digitLabel.text!.hasSuffix("/") || digitLabel.text!.hasSuffix(".") || resultLabel.text == "ERROR" || digitLabel.text!.hasSuffix("(") || paranthesesLeftCount != paranthesesRightCount {
        } else {
            if !digitLabel.text!.hasSuffix(")") && !digitLabel.text!.contains(".") {
                digitLabel.text! += ".0"
            }
            digitLabel.text = digitLabel.text!.replacingOccurrences(of: "x", with: "*")
            
            //DotError
            mathMethod()
            
            if resultLabel.text! == "ERROR" {} else {
         // error handling
            let expn = NSExpression(format: digitLabel.text!)
            resultLabel.text = "\(expn.expressionValue(with: nil, context: nil) as! Double)"
            digitLabel.text = "0"
            paranthesesLeftCount = 0
            paranthesesRightCount = 0
            }
        }
    }
    //DotError
    func mathMethod() {
        var digit: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "."]
        var textArray: [String] = []
        var answerArray: [String] = []
        var finalText = digitLabel.text!
        var texter = ""
        for i in finalText{
            textArray.append("\(i)")
        }
        for j in textArray {
            if digit.contains(j) {
                if j == "." && texter.contains(".") {
                    resultLabel.text! = "ERROR"
                    textArray.removeAll()
                    answerArray.removeAll()
                }
                else {
                    texter += j
                }
            }
            else {
                answerArray.append(texter)
                answerArray.append(j)
                texter = ""
            }
        }
    }
}
