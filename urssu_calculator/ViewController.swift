//
//  ViewController.swift
//  urssu_calculator
//
//  Created by 서준영 on 4/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstNumTextField: UITextField!
    
    @IBOutlet weak var secondNumTextField: UITextField!
    

    @IBOutlet weak var infoLabel: UILabel!
    
    
    @IBOutlet weak var addButton: UIButton!
    
    
    @IBOutlet weak var subtractButton: UIButton!
    
    
    @IBOutlet weak var multiplyButton: UIButton!
    
    
    @IBOutlet weak var divideButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = "버튼을 눌러주세요!"
    }
    
    // 여기부터 액션 연결
    
    @IBAction func addAction(_ sender: UIButton) {
        let num1: Int? = Int(firstNumTextField.text!)
        let num2: Int? = Int(secondNumTextField.text!)
        var result: Int = 0
        
        if let reNum1 = num1 { // 첫째 값은 있을 때
            if let reNum2 = num2 { // 둘째 값도 있을 때
                result = reNum1 + reNum2
                infoLabel.text = firstNumTextField.text! + " + " + secondNumTextField.text! + " = " + "\(result)"
            }
            else {
                infoLabel.text = "숫자를 모두 입력해주세요"
            }
        }
        else if let reNum2 = num2 {
            infoLabel.text = "숫자를 모두 입력해주세요"
        }
        else {
            infoLabel.text = "값을 먼저 입력해주세요"
        }
    }
    
    
    
    @IBAction func subAction(_ sender: UIButton) {
        let num1: Int? = Int(firstNumTextField.text!)
        let num2: Int? = Int(secondNumTextField.text!)
        var result: Int = 0
        
        if let reNum1 = num1 { // 첫째 값은 있을 때
            if let reNum2 = num2 { // 둘째 값도 있을 때
                result = reNum1 - reNum2
                infoLabel.text = firstNumTextField.text! + " - " + secondNumTextField.text! + " = " + "\(result)"
            }
            else {
                infoLabel.text = "숫자를 모두 입력해주세요"
            }
        }
        else if let reNum2 = num2 {
            infoLabel.text = "숫자를 모두 입력해주세요"
        }
        else {
            infoLabel.text = "값을 먼저 입력해주세요"
        }
    }
    
    
    @IBAction func mulAction(_ sender: UIButton) {
        let num1: Int? = Int(firstNumTextField.text!)
        let num2: Int? = Int(secondNumTextField.text!)
        var result: Int = 0
        
        if let reNum1 = num1 { // 첫째 값은 있을 때
            if let reNum2 = num2 { // 둘째 값도 있을 때
                result = reNum1 * reNum2
                infoLabel.text = firstNumTextField.text! + " X " + secondNumTextField.text! + " = " + "\(result)"
            }
            else {
                infoLabel.text = "숫자를 모두 입력해주세요"
            }
        }
        else if let reNum2 = num2 {
            infoLabel.text = "숫자를 모두 입력해주세요"
        }
        else {
            infoLabel.text = "값을 먼저 입력해주세요"
        }
    }
    
    
    @IBAction func divAction(_ sender: UIButton) {
        let num1: Int? = Int(firstNumTextField.text!)
        let num2: Int? = Int(secondNumTextField.text!)
        var result: Int = 0
        
        if let reNum1 = num1 { // 첫째 값은 있을 때
            if let reNum2 = num2 { // 둘째 값도 있을 때
                if reNum2 == 0 {
                    infoLabel.text = "0으로 나눌 수 없습니다."
                }
                else {
                    result = reNum1 / reNum2
                    infoLabel.text = firstNumTextField.text! + " / " + secondNumTextField.text! + " = " + "\(result)"
                }
                
            }
            else {
                infoLabel.text = "숫자를 모두 입력해주세요"
            }
        }
        else if let reNum2 = num2 {
            infoLabel.text = "숫자를 모두 입력해주세요"
        }
        else {
            infoLabel.text = "값을 먼저 입력해주세요"
        }
    }
    // 강제추출 옵셔널이라서 nil값이 들어오면 문제가 생김 -> guard-let or if-let 고려하기
}

