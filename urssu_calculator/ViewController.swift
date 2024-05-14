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
    
    // 텍스트 필드 옵셔널 바인딩
    func validateAndGetInt(from textField: UITextField) -> Int? {
        guard let text = textField.text, let number = Int(text) else {
            return nil
        }
        return number
    }
    // 결과를 업데이트하는 공통 함수
    func updateResultLabel(_ result: String) {
        infoLabel.text = result
    }
    
    enum CalculatorError: Error {
        case divideWithZero
    }
    
    
    @IBAction func addAction(_ sender: UIButton) {
        guard let num1 = validateAndGetInt(from: firstNumTextField) else {
            // 1값이 없을 때
            guard let num2 = validateAndGetInt(from: secondNumTextField) else {
                // 2값이 없을 때
                updateResultLabel("값을 먼저 입력해주세요")
                return
            }
            // 2값이 있을 때
            updateResultLabel("숫자를 모두 입력해주세요")
            return
        }
        // 1값이 있을 때
        guard let num2 = validateAndGetInt(from: secondNumTextField) else {
            // 2값이 없을 때
            updateResultLabel("숫자를 모두 입력해주세요")
            return
        }
        // 2값이 있을 때
        let result = num1 + num2
        updateResultLabel("\(num1) + \(num2) = \(result)")
    }
    
    
    
    @IBAction func subAction(_ sender: UIButton) {
        guard let num1 = validateAndGetInt(from: firstNumTextField) else {
            // 1값이 없을 때
            guard let num2 = validateAndGetInt(from: secondNumTextField) else {
                // 2값이 없을 때
                updateResultLabel("값을 먼저 입력해주세요")
                return
            }
            // 2값이 있을 때
            updateResultLabel("숫자를 모두 입력해주세요")
            return
        }
        // 1값이 있을 때
        guard let num2 = validateAndGetInt(from: secondNumTextField) else {
            // 2값이 없을 때
            updateResultLabel("숫자를 모두 입력해주세요")
            return
        }
        // 2값이 있을 때
        let result = num1 - num2
        updateResultLabel("\(num1) - \(num2) = \(result)")
    }
    
    
    @IBAction func mulAction(_ sender: UIButton) {
        guard let num1 = validateAndGetInt(from: firstNumTextField) else {
            // 1값이 없을 때
            guard let num2 = validateAndGetInt(from: secondNumTextField) else {
                // 2값이 없을 때
                updateResultLabel("값을 먼저 입력해주세요")
                return
            }
            // 2값이 있을 때
            updateResultLabel("숫자를 모두 입력해주세요")
            return
        }
        // 1값이 있을 때
        guard let num2 = validateAndGetInt(from: secondNumTextField) else {
            // 2값이 없을 때
            updateResultLabel("숫자를 모두 입력해주세요")
            return
        }
        // 2값이 있을 때
        let result = num1 * num2
        updateResultLabel("\(num1) * \(num2) = \(result)")
    }
    
    
    @IBAction func divAction(_ sender: UIButton) {
        func divide() throws {
            guard let num1 = validateAndGetInt(from: firstNumTextField) else {
                // 1값이 없을 때
                guard let num2 = validateAndGetInt(from: secondNumTextField) else {
                    // 2값이 없을 때
                    updateResultLabel("값을 먼저 입력해주세요")
                    return
                }
                // 2값이 있을 때
                updateResultLabel("숫자를 모두 입력해주세요")
                return
            }
            // 1값이 있을 때
            guard let num2 = validateAndGetInt(from: secondNumTextField) else {
                // 2값이 없을 때
                updateResultLabel("숫자를 모두 입력해주세요")
                return
            }
            // 2값이 있을 때
            guard num2 != 0 else {
                // num2가 0일때
                throw CalculatorError.divideWithZero
            }
            let result = num1 / num2
            updateResultLabel("\(num1) / \(num2) = \(result)")
        }
        
        do {
            try divide()
        } catch CalculatorError.divideWithZero {
            infoLabel.text = "0으로는 나눌 수 없습니다."
        } catch {
            
        }

    }
}

