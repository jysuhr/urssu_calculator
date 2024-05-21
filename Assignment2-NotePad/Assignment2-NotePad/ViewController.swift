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
    }


}

class AddMemo: UIViewController, UITextViewDelegate {

    @IBOutlet weak var registerButton: UIBarButtonItem!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsTextView.delegate = self
        contentsTextView.text = "내용을 작성해주세요" // 텍스트뷰를 건드리지 않았을 때
        contentsTextView.textColor = UIColor.lightGray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if contentsTextView.text.isEmpty {
            contentsTextView.text = "내용을 작성해주세요" // 텍스트뷰에서 커서를 뗄 때
            contentsTextView.textColor = UIColor.lightGray
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentsTextView.textColor == UIColor.lightGray {
            contentsTextView.text = nil
            contentsTextView.textColor = UIColor.black
        }
    }
    


}
