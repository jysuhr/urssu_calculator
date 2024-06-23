//
//  ViewController.swift
//  Assignment v.23-2
//
//  Created by 서준영 on 6/23/24.
//

import UIKit
import YDS

// JSON 데이터 모델
struct ArticleResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let body: String
    let author: Author
    let tagList: [String]
}

struct Author: Codable {
    let username: String
    let image: String
    let following: Bool
}

class ViewController: UIViewController {

    let titleLabel = YDSLabel()
    let bodyTextView = YDSTextView()
    let nameLabel = YDSLabel()
    let profileImage = YDSProfileImageView()
    let following = YDSPlainButton()
    let tagStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = YDSColor.bgNormal
        
        titleLabelSetup()
        bodyTextViewSetup()
        nameLabelSetup()
        profileImageSetup()
        followingSetup()
        tagStackViewSetup()
        
        // JSON 데이터 가져오기
        fetchArticle()
    }
    
    // MARK: - 레이아웃
    func titleLabelSetup() {
        // YDSLabel 설정
        titleLabel.text = "불러오는 중..."
        titleLabel.textAlignment = .center
        titleLabel.font = YDSFont.title1 // 적용이 안됨
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        
        // YDSLabel을 뷰에 추가
        self.view.addSubview(titleLabel)
        
        // YDSLabel 제약조건
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

    }
    
    func bodyTextViewSetup() {
        // YDSTextView 설정
        bodyTextView.text = "불러오는 중..."
        bodyTextView.translatesAutoresizingMaskIntoConstraints = false
        bodyTextView.isEditable = false
        
        // YDSTextView를 뷰에 추가
        self.view.addSubview(bodyTextView)
        
        // YDSTextView 제약조건
        NSLayoutConstraint.activate([
            bodyTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 177),
            bodyTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            bodyTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            bodyTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -69)
        ])
    }
    
    func nameLabelSetup() {
        // YDSLabel 설정
        nameLabel.text = "불러오는 중..."
        nameLabel.textAlignment = .center
        nameLabel.font = YDSFont.title1 // 적용이 안됨
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        
        // YDSLabel을 뷰에 추가
        self.view.addSubview(nameLabel)
        
        // YDSLabel 제약조건
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: bodyTextView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 137),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -138),
        ])
    }
    
    func profileImageSetup() {
        profileImage.size = YDSProfileImageView.ProfileImageViewSize.medium
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        // YDSProfileImageView를 뷰에 추가
        self.view.addSubview(profileImage)
        
        // YDSProfileImageView 제약조건
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: bodyTextView.bottomAnchor, constant: 10),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -311)
        ])
    }
    
    func followingSetup() {
        following.rightIcon = YDSIcon.starLine //.starFilled
        following.translatesAutoresizingMaskIntoConstraints = false
        following.size = YDSPlainButton.PlainButtonSize.large
        
        // YDSPlainButton 뷰에 추가
        self.view.addSubview(following)
        
        // YDSPlainButton 제약조건
        NSLayoutConstraint.activate([
            following.centerYAnchor.constraint(equalTo: bodyTextView.bottomAnchor, constant: 10),
            following.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 311),
            following.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    func tagStackViewSetup() {
        tagStackView.axis = .horizontal
        tagStackView.spacing = 8
        tagStackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(tagStackView)

        NSLayoutConstraint.activate([
            tagStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tagStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tagStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    
    // MARK: - JSON 불러오기
    
    func fetchArticle() {
        // JSON 데이터 URL
        let urlString = "https://api.realworld.io/api/articles?limit=1"
        
        // URL 생성
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        // URLSession을 사용한 데이터 가져오기
        URLSession.shared.dataTask(with: url) { data, response, error in
            // 에러 체크
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            // 데이터 체크
            guard let data = data else {
                print("No data returned")
                return
            }
            
            // JSON 디코딩
            do {
                let articleResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
                
                // UI 업데이트는 메인 스레드에서
                DispatchQueue.main.async {
                    if let article = articleResponse.articles.first {
                        self.titleLabel.text = article.title
                        self.bodyTextView.text = article.body
                        self.nameLabel.text = article.author.username
                        
                        // 프로필 이미지 URL에서 UIImage 가져오기
                        if let imageUrl = URL(string: article.author.image) {
                            URLSession.shared.dataTask(with: imageUrl) { imageData, _, _ in
                                if let imageData = imageData {
                                    DispatchQueue.main.async {
                                        self.profileImage.image = UIImage(data: imageData)
                                    }
                                }
                            }.resume()
                        } else {
                            self.profileImage.image = nil
                        }
                        // following 정보 가져오기
                        if article.author.following {
                            self.following.leftIcon = YDSIcon.starFilled
                        } else {
                            self.following.leftIcon = YDSIcon.starLine
                        }
                        self.updateTags(with: article.tagList)
                        
                    } else {
                        self.titleLabel.text = "No title available"
                        self.bodyTextView.text = "No content available"
                        self.nameLabel.text = "No name available"
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    

    func updateTags(with tags: [String]) {
        for tag in tags {
            let tagBadge = YDSBadge()
            tagBadge.text = tag
            tagBadge.icon = YDSIcon.clipLine
            tagBadge.color = YDSItemColor.aqua
            tagStackView.addArrangedSubview(tagBadge)
        }
    }
}
