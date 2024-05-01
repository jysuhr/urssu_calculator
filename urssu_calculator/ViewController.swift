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
        var result: Int
        result = num1! + num2!
        info_lable.text = firstNum_textField.text! + " + " + secondNum_textField.text! + " = " + "\(result)"
    }
    
    @IBAction func sub_action(_ sender: UIButton) {
        let num1: Int? = Int(firstNum_textField.text!)
        let num2: Int? = Int(secondNum_textField.text!)
        var result: Int
        result = num1! - num2!
        info_lable.text = firstNum_textField.text! + " - " + secondNum_textField.text! + " = " + "\(result)"
    }
    
    
    @IBAction func mul_action(_ sender: UIButton) {
        let num1: Int? = Int(firstNum_textField.text!)
        let num2: Int? = Int(secondNum_textField.text!)
        var result: Int
        result = num1! * num2!
        info_lable.text = firstNum_textField.text! + " X " + secondNum_textField.text! + " = " + "\(result)"
    }
    
    
    @IBAction func div_action(_ sender: UIButton) {
        let num1: Int? = Int(firstNum_textField.text!)
        let num2: Int? = Int(secondNum_textField.text!)
        var result: Int
        result = num1! / num2!
        info_lable.text = firstNum_textField.text! + " / " + secondNum_textField.text! + " = " + "\(result)"
    }
    
    
    
    
    
    
}

