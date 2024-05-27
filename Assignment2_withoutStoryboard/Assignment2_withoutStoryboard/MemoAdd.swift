//
//  MemoAdd.swift
//  Assignment2_withoutStoryboard
//
//  Created by 서준영 on 5/26/24.
//

import UIKit

class MemoAdd: UIViewController {
    
    weak var delegate: MemoDataDelegate?
    let titleTextField = UITextField()
    let contentsTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "메모 작성"
        self.view.backgroundColor = .white
        
        // 네비게이션 아이템 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(registGoToMain))
        
        // titleTextField 추가
        setupTitleTextField()
        
        // contentsTextView 추가
        contentsTextView.text = "내용을 작성해주세요"
        contentsTextView.delegate = self
        setupContentsTextView()
    }
    
    //MARK: -titleTextField 구성
    private func setupTitleTextField() {
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.placeholder = "제목을 작성해주세요"
        titleTextField.textColor = .black
        titleTextField.borderStyle = .roundedRect
        
        // view에 추가
        self.view.addSubview(titleTextField)
        
        // 제약조건
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 123),
            titleTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 26),
            titleTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -27)
        ])
    }
    
    // MARK: -textView 구성
    private func setupContentsTextView() {
        contentsTextView.translatesAutoresizingMaskIntoConstraints = false
        contentsTextView.textColor = .lightGray
        contentsTextView.font = UIFont.systemFont(ofSize: 16)
        contentsTextView.layer.cornerRadius = 5.0
        contentsTextView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        // view에 추가
        self.view.addSubview(contentsTextView)
        
        // 제약조건
        NSLayoutConstraint.activate([
            contentsTextView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 178),
            contentsTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 26),
            contentsTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -27),
            contentsTextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -35)
        ])
    }
    
    // MARK: -
    func sendDataToMainVC() {
        guard let title = titleTextField.text, !title.isEmpty, let contents = contentsTextView.text else { return }
        
        // 메모 데이터 전달
        delegate?.memoDataUpdated(title: title, content: contents)
    }
    
    
    @objc fileprivate func registGoToMain() {
        print("ViewController - goToMemoAdd() 호출됨")
        sendDataToMainVC()

        if let mainViewController = navigationController?.viewControllers.first(where: { $0 is MainViewController }) as? MainViewController {
            // 메인 화면으로 돌아가기
            navigationController?.popToViewController(mainViewController, animated: true)
        }
    }
}


// MARK: -textView Placeholder 구현
extension MemoAdd: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "내용을 작성해주세요" {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용을 작성해주세요"
            textView.textColor = .lightGray
        }
    }
}
