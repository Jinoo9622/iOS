//
//  ViewController.swift
//  Calculator
//
//  Created by 박진우 on 2021/09/28.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case Equal
    case unknown
}

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""  // 계산기 버튼을 누를때마다 보여지는 숫자
    var firstOperand = ""   // 이전 계산값(피연산자)을 저장하는 property
    var secondOperand = ""  // 새롭게 입력된 피연산자를 저장하는 property
    var result = ""         // 계산의 결과값 저장
    var currentOperation: Operation = .unknown  // 현재 계산기에 입력된 연산자
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        // 9자리까지만 입력 가능
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        // 소숫점 포함 9자리까지 입력 가능
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.opertaion(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.opertaion(.Multiply)
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.opertaion(.Subtract)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.opertaion(.Add)
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.opertaion(.Equal)
    }
    
    func opertaion(_ opertaion: Operation) {
        if self.currentOperation != .unknown {      // 첫번째 피연산자와 두번째 피연산자 계산
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                default:
                    break
                }
                // 소수점 이하가 0인 경우(result.truncatingRemainder(dividingBy: 1) == 0), Int형으로 변환
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
                
                
            }
            
            if opertaion == .Equal {
                self.firstOperand = ""
                self.secondOperand = ""
                self.result = ""
                self.currentOperation = .unknown
            } else {
                self.currentOperation = opertaion
            }
            
        } else {    // 초기상태의 계산기상태 (첫번째 피연산자와 선택한 연산자 저장)
            self.firstOperand = self.displayNumber
            self.currentOperation = opertaion
            self.displayNumber = ""
        }
    }
}

