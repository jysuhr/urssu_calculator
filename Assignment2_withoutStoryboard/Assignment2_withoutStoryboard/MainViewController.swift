//
//  ViewController.swift
//  Assignment2_withoutStoryboard
//
//  Created by 서준영 on 5/26/24.
//

import UIKit

class MainViewController: UIViewController, MemoDataDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var memoDic: [String?: String] = [:]
    var numDic: [Int: String?] = [:]
    var knum: Int = 0
    var memoTable = UITableView()
    let noMemoLabel = UILabel()
    var memoOrder: [String] = [] // 메모 생성 순서를 저장
    
    // 로우 넘버 데이터 전달 프로토콜 채택
    weak var delegate: RowValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 델리게이트 설정
        let addMemoVC = MemoAdd()
        addMemoVC.delegate = self
        
        self.title = "메모 목록"
        self.view.backgroundColor = .white
        
        // 네비게이션 아이템 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(goToMemoAdd))
        
        // MARK: - 메모가 없을때 나오는 레이블
        // 레이블 생성
        noMemoLabel.translatesAutoresizingMaskIntoConstraints = false
        noMemoLabel.text = "메모가 없습니다\n메모를 추가해주세요!"
        noMemoLabel.textAlignment = .center
        noMemoLabel.textColor = .lightGray
        noMemoLabel.numberOfLines = 0
        
        // noMemoLabel을 view에 추가
        self.view.addSubview(noMemoLabel)
        
        // noMemoLabel의 제약조건 설정
        NSLayoutConstraint.activate([
            noMemoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            noMemoLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 426)
        ])
        
        setupTableView()
        updateMemoList()
    }
    
    func updateMemoList() {
        memoTable.reloadData() // 테이블 뷰를 다시 로드하여 메모 리스트를 업데이트
        print("53.현재 메모딕셔너리의 상태(비어있어야함)\(memoDic)")
        // 딕셔너리가 비어 있는지 확인하여 라벨 표시 여부 결정
        if memoDic.isEmpty {
            noMemoLabel.isHidden = false // 메모가 없는 경우 라벨을 보이도록 설정
            memoTable.isHidden = true
        } else {
            noMemoLabel.isHidden = true // 메모가 있는 경우 라벨을 숨김
            memoTable.isHidden = false
        }
    }
    
    // MARK: - Delegate
    // 델리게이트 메서드 구현
    func memoDataUpdated(title: String?, content: String?) {
        guard let title = title, let content = content else { return }
        memoDic[title] = content
        memoOrder.append(title)
        numDic[knum] = title
        knum += 1
        
        print("76.MemoDic 업데이트: \(memoDic)") // memoDic 확인
        print("77.numDic: \(numDic)") // numDic 확인
        updateMemoList()
        // 테이블 뷰 업데이트
        self.memoTable.reloadData()
    }
    
    // MARK: - 테이블 뷰
    func setupTableView() {
        // TableView 설정
        memoTable.delegate = self
        memoTable.dataSource = self
        memoTable.translatesAutoresizingMaskIntoConstraints = false
        
        // TableView 등록
        memoTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // TableView 추가
        view.addSubview(memoTable)
        
        // Auto Layout 설정
        NSLayoutConstraint.activate([
            memoTable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            memoTable.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 103),
            memoTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 18),
            memoTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17),
            memoTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -15)
        ])
    }
    
    // table의 열수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoDic.count
    }
    
    // 셀 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let key = memoOrder[memoOrder.count - (indexPath.row + 1)]
        
        if let value = memoDic[key] {
            cell.textLabel?.text = key
            cell.detailTextLabel?.text = value
        }

        return cell
    }
    
    // 셀의 선택
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 셀의 줄
        print("로우: \(indexPath.row)")
        
        // MemoView 뷰컨트롤러로 화면 전환
        let memoViewVC = MemoView(/*row: indexPath.row, */titleForMemoView: "\(numDic[indexPath.row]!)", contentsForMemoView: "\(memoDic[numDic[indexPath.row]!])")
        
        // 로우 넘버 데이터 타이틀과 내용 전달
        memoViewVC.didRecieveData(/*data: indexPath.row, */titleForMemoView: "\(numDic[(numDic.count - 1) - indexPath.row]!!)", contentsForMemoView: memoDic["\(numDic[(numDic.count - 1) - indexPath.row]!!)"] ?? "noData")
        
        
        
        navigationController?.pushViewController(memoViewVC, animated: true)
    }
    
    // MARK: - Navigation Item 기능
    @objc fileprivate func goToMemoAdd() {
        print("ViewController - goToMemoAdd() 호출됨")
        let memoAddVC = MemoAdd()
        memoAddVC.delegate = self
        self.navigationController?.pushViewController(memoAddVC, animated: true)
    }
    
    
}
