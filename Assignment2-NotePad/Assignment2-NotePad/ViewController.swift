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
        
    }


}

var memoDic: Dictionary<String?, String> = [String?: String]()

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
    
    // 내용 테스트용 함수 (나중에 삭제)
    func preView() {
        print(contentsTextView.text!)
    }
    
    
    @IBAction func registAction(_ sender: Any) {
        
        preView() // 나중에 삭제
        
        memoDic[titleTextField.text] = contentsTextView.text
        
        print(memoDic)
        navigationController?.popViewController(animated: true)
    }
}

class MemoList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var noMemoLabel: UILabel!
    @IBOutlet weak var memoTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        noMemoLabel.text = "메모가 없습니다.\n메모를 추가해주세요!"
        memoTable.dataSource = self
        memoTable.delegate = self
        updateMemoList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memoTable.reloadData() // 화면이 나타날 때마다 갱신
        updateMemoList()
    }
    
    func updateMemoList() {
        memoTable.reloadData() // 테이블 뷰를 다시 로드하여 메모 리스트를 업데이트합니다.
        
        // 딕셔너리가 비어 있는지 확인하여 라벨 표시 여부 결정
        if memoDic.isEmpty {
            noMemoLabel.isHidden = false // 메모가 없는 경우 라벨을 보이도록 설정합니다.
            memoTable.isHidden = true
        } else {
            noMemoLabel.isHidden = true // 메모가 있는 경우 라벨을 숨깁니다.
            memoTable.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoDic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "myCell")
        let key = Array(memoDic.keys)[indexPath.row]
        cell.textLabel?.text = key // 제목
        cell.detailTextLabel?.text = memoDic[key] // 내용
        return cell
    }


}
