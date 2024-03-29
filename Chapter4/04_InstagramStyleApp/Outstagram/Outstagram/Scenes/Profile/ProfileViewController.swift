//
//  ProfileViewController.swift
//  Outstagram
//
//  Created by 박진우 on 2022/02/16.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40.0
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요."
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("팔로우", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        button.backgroundColor = .systemBlue
        
        button.layer.cornerRadius = 3.0
        
        return button
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("메시지", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        button.backgroundColor = .white
        
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        
        return button
    }()
    
    private let photoDataView = ProfileDataView(title: "게시물", count: 123)
    private let followerDataView = ProfileDataView(title: "팔로워", count: 2123)
    private let followingDataView = ProfileDataView(title: "팔로잉", count: 1)
    
    // collectionView로 생성
    // 1. 1row에 3개의 데이터(이미지)로 구성 (UITableView 불가)
    // 2. n개의 데이터 사용 -> ReUseable하게 구성 (UIStackView 사용 시, 부하 발생)
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        setupLayout()
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        
        let image = UIImage(named: "lion") ?? UIImage()
        cell.setup(with: image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 3) - 1.0
        return CGSize(width: width, height: width)
    }
}

private extension ProfileViewController {
    func setupNavigationItems() {
        navigationItem.title = "UserName"
        
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(didTapRightBarButtonItem(_:)))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func didTapRightBarButtonItem(_ item: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        [
            UIAlertAction(title: "회원 정보 변경", style: .default) { _ in
                print("회원 정보 변경 Tapped!!")
            },
            UIAlertAction(title: "탈퇴하기", style: .destructive) { _ in
                print("탈퇴하기 Tapped!!")
            },
            UIAlertAction(title: "닫기", style: .cancel) { _ in
                print("닫기 Tapped!!")
            }
        ].forEach { actionSheet.addAction($0) }
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    func setupLayout() {
        let buttonStackView = UIStackView(arrangedSubviews: [followButton, messageButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 4.0
        buttonStackView.distribution = .fillEqually
        
        let dataStackView = UIStackView(arrangedSubviews: [photoDataView, followerDataView, followingDataView])
        dataStackView.axis = .horizontal
        dataStackView.spacing = 4.0
        dataStackView.distribution = .fillEqually
        
        [
            profileImageView, dataStackView, nameLabel, descriptionLabel, buttonStackView, collectionView
        ].forEach { view.addSubview($0) }
        
        let inset: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(80.0)
            $0.height.equalTo(profileImageView.snp.width)
        }
        
        dataStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(inset)
            $0.trailing.equalToSuperview().inset(inset)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(12.0)
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalToSuperview().inset(inset)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(12.0)
            $0.leading.trailing.equalToSuperview().inset(inset)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(buttonStackView.snp.bottom).offset(inset)
            $0.bottom.equalToSuperview()
        }
    }
}
