//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 박진우 on 2022/07/10.
//

import UIKit
import Kingfisher

protocol ReviewListProtocol {
    func setupNavigationBar()
    func setupViews()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

final class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    private var reviews: [BookReview] = []
    
    init(viewController: ReviewListProtocol, userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func viewWillAppear() {
        // TODO: UserDefaults 내용 업데이트하기
        reviews = userDefaultsManager.getReviews()
        viewController.reloadTableView()
    }
    
    func didTapRightBarButton() {
        viewController.presentToReviewWriteViewController()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.imageView?.kf.setImage(with: reviews[indexPath.row].imageURL, placeholder: .none) {
            _ in
            cell.setNeedsLayout()   // 앱 실행 시, 썸네일 이미지가 그려지지않는 현상 보완
        }
        cell.textLabel?.text = reviews[indexPath.row].title
        cell.detailTextLabel?.text = reviews[indexPath.row].contents
        
        cell.selectionStyle = .none
        
        return cell
    }
}
