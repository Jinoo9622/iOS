//
//  MockReviewListViewController.swift
//  BookReviewTests
//
//  Created by 박진우 on 2022/07/15.
//

import Foundation
@testable import BookReview

final class MockReviewListViewController: ReviewListProtocol {
    // presenter와 viewcontroller 사이의 연결된 flow 확인
    var isCalledSetupNavigationBar = false
    var isCalledSetupViews = false
    var isCalledPresentToReviewWriteViewController = false
    var isCalledReloadTableView = false
    
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func presentToReviewWriteViewController() {
        isCalledPresentToReviewWriteViewController = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
}
