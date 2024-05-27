//
//  MemoView.swift
//  Assignment2_withoutStoryboard
//
//  Created by 서준영 on 5/26/24.
//

import UIKit

class MemoView: UIViewController {
    
    let titleLabel = UILabel()
    let memoTextView = UITextView()
    var row: Int = 0
    
    init(row: Int) {
        self.row = row
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        titleLabel.text = "안녕하세요?"
        
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
        memoTextView.text = "메모의 내용"
        
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
