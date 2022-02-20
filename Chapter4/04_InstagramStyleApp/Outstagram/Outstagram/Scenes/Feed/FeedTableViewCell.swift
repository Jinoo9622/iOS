//
//  FeedTableViewCell.swift
//  Outstagram
//
//  Created by 박진우 on 2022/02/13.
//

import UIKit
import SnapKit

final class FeedTableViewCell: UITableViewCell {

    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "heart")
        
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "message")
        
        return button
    }()
    
    private lazy var directMessageButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "paperplane")
        
        return button
    }()
    
    private lazy var bookMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "bookmark")
        
        return button
    }()
    
    private lazy var likeCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "~~님 외 123명이 좋아합니다"
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.numberOfLines = 5
        label.text = """
         1. 우리는 나이가 들면서 변하는 게 아니다. 보다 자기 다뤄지는 것이다.
         2. 게으르지 않음은 영원한 삶의 집이요, 게으름은 죽음의 집이다.
         3. 나는 날마다, 모든 면에서, 점점 더 좋아지고 있다.
         4. 인생에 뜻을 세우는데 적당한 때는 없다.
         5. 실패는 잊어라. 하지만 그것이 준 교훈은 절대 잊으면 안 된다.
         6. 우리는 행복하기 때문에 웃는 게 아니라, 웃기 때문에 행복하다.
         7. 너 자신이 돼라. 다른 사람은 이미 있으니까.
         8. 세상에 공짜는 없다.
         9. 또 후회한들 무엇하랴.
         10. 인생은 가까이서 보면 비극, 멀리서 보면 희극이다.
         """
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "1일 전"
        
        return label
    }()
    
    func setup() {
        [
            postImageView,
            likeButton,
            commentButton,
            directMessageButton,
            bookMarkButton,
            likeCountLabel,
            contentsLabel,
            dateLabel
        ].forEach { self.addSubview($0) }
        
        postImageView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }
        
        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0
        
        likeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.height.equalTo(buttonWidth)
        }
        
        commentButton.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.height.equalTo(buttonWidth)
        }
        
        directMessageButton.snp.makeConstraints {
            $0.leading.equalTo(commentButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.height.equalTo(buttonWidth)
        }
        
        bookMarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.height.equalTo(buttonWidth)
        }
        
        likeCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookMarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookMarkButton.snp.trailing)
            $0.top.equalTo(likeCountLabel.snp.bottom).offset(8.0)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookMarkButton.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(buttonInset)
        }
    }
}
