//
//  ViewController.swift
//  Assignment2-NotePad
//
//  Created by 서준영 on 5/19/24.
//

import UIKit

class ViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class MemoList: UIViewController {
    
    
    @IBOutlet weak var noMemoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noMemoLabel.text = "메모가 없습니다.\n메모를 추가해주세요!"
        // Do any additional setup after loading the view.
    }


}

class AddMemo: UIViewController, UITextViewDelegate {

    @IBOutlet weak var registerButton: UIBarButtonItem!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contentsTextView.delegate = self
    }


}
