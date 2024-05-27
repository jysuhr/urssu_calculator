//
//  MemoView.swift
//  Assignment2_withoutStoryboard
//
//  Created by 서준영 on 5/26/24.
//

import UIKit

class MemoView: UIViewController, RowValue {
    
    let titleLabel = UILabel()
    let memoTextView = UITextView()
//    var row: Int = 0
    var titleForMemoView: String? = "tit"
    var contentsForMemoView: String = "con"
//    var numRow: Int = 5 // 로우 넘버를 저장하는 변수 < 필요 없을 듯
//    var memoDic: [String?: String] = [:] // 삭제
//    var numDic: [Int: String?] = [:] // 삭제
    var knum: Int = 0
    var titleF: String? = "ti"
    var contentF: String = "co"
    
    
    init(/*row: Int, */titleForMemoView: String?, contentsForMemoView: String) {
//        self.row = row
        self.titleForMemoView = titleForMemoView
        self.contentsForMemoView = contentsForMemoView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MainVC 로부터 데이터를 전달받는 부분
    func didRecieveData(/*data: Int, */titleForMemoView: String?, contentsForMemoView: String) {
//        print("받은 로우 넘버: \(data)")
//        numRow = data
        titleF = titleForMemoView
        contentF = contentsForMemoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "메모 상세"
        view.backgroundColor = .white
        setuptitleLabel()
        setupmemoTextView()
    }
    
    //MARK: -titleLabel 구성
    private func setuptitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.font = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .title1).pointSize)
        titleLabel.text = titleF
        
        // view에 추가
        self.view.addSubview(titleLabel)
        
        // 제약조건
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 137),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 36)
        ])
    }
    
    // MARK: -memoTextView 구성
    private func setupmemoTextView() {
        memoTextView.translatesAutoresizingMaskIntoConstraints = false
        memoTextView.textColor = .black
        memoTextView.font = UIFont.systemFont(ofSize: 16)
        memoTextView.layer.cornerRadius = 5.0
        memoTextView.backgroundColor = .white
        memoTextView.text = contentF
        
        // view에 추가
        self.view.addSubview(memoTextView)
        
        // 제약조건
        NSLayoutConstraint.activate([
            memoTextView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 169),
            memoTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 36),
            memoTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -36),
            memoTextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10)
        ])
    }
}
