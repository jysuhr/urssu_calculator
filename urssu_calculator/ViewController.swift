//
//  ViewController.swift
//  urssu_calculator
//
//  Created by 서준영 on 4/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstNum_textField: UITextField!
    
    
    @IBOutlet weak var secondNum_textField: UITextField!
    
    
    @IBOutlet weak var info_lable: UILabel!
    
    
    @IBOutlet weak var add_button: UIButton!
    
    
    @IBOutlet weak var subtract_button: UIButton!
    
    
    @IBOutlet weak var multiply_button: UIButton!
    
    
    @IBOutlet weak var divide_button: UIButton!
    
    
    @IBOutlet weak var ok_button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        info_lable.text = "버튼을 눌러주세요!"
        //firstNum_textField.text = "첫번째 숫자를 입력해주세요" // 클릭하면 없어지는 글자여야돼는데...
        
    }
    
    // 여기에 액션 연결
    
    @IBAction func add_action(_ sender: UIButton) {
        let num1: Int? = Int(firstNum_textField.text!)
        let num2: Int? = Int(secondNum_textField.text!)
        var result: Int = 0
        if let reNum1 = num1, let reNum2 = num2 {
            result = reNum1 + reNum2
            info_lable.text = firstNum_textField.text! + " + " + secondNum_textField.text! + " = " + "\(result)"
        }
        else {
            info_lable.text = "숫자를 모두 입력해주세요"
        }
    }
    
    @IBAction func sub_action(_ sender: UIButton) {
        let num1: Int? = Int(firstNum_textField.text!)
        let num2: Int? = Int(secondNum_textField.text!)
        var result: Int = 0
        if let reNum1 = num1, let reNum2 = num2 {
            result = reNum1 - reNum2
            info_lable.text = firstNum_textField.text! + " - " + secondNum_textField.text! + " = " + "\(result)"
        }
        else {
            info_lable.text = "숫자를 모두 입력해주세요"
        }
    }
    
    
    @IBAction func mul_action(_ sender: UIButton) {
        let num1: Int? = Int(firstNum_textField.text!)
        let num2: Int? = Int(secondNum_textField.text!)
        var result: Int = 0
        
        if let reNum1 = num1, let reNum2 = num2 {
            result = reNum1 * reNum2
            info_lable.text = firstNum_textField.text! + " X " + secondNum_textField.text! + " = " + "\(result)"
        }
        else {
            info_lable.text = "숫자를 모두 입력해주세요"
        }
    }
    
    
    @IBAction func div_action(_ sender: UIButton) {
        let num1: Int? = Int(firstNum_textField.text!)
        let num2: Int? = Int(secondNum_textField.text!)
        var result: Int = 0
        
        if let reNum1 = num1, let reNum2 = num2 {
            result = reNum1 / reNum2
            info_lable.text = firstNum_textField.text! + " / " + secondNum_textField.text! + " = " + "\(result)"
        }
        else {
            info_lable.text = "숫자를 모두 입력해주세요"
        }
    }
    // 강제추출 옵셔널이라서 nil값이 들어오면 문제가 생김 -> guard-let or if-let 고려하기
}

