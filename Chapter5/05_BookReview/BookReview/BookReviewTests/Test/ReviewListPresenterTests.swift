//
//  ReviewListPresenterTests.swift
//  ReviewListPresenterTests
//
//  Created by 박진우 on 2022/07/10.
//

import XCTest
@testable import BookReview

class ReviewListPresenterTests: XCTestCase {
    var sut: ReviewListPresenter!
    var viewController: MockReviewListViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = ReviewListPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager
        )
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        userDefaultsManager = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)    // 해당 값이 true인지 확인
        //XCTAssertFalse(viewController.isCalledSetupNavigationBar)   // 해당 값이 false인지 확인
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_viewWllAppear() {
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isCalledGetReviews)
        XCTAssertTrue(viewController.isCalledReloadTableView)
    }
    
    func test_didTapRightBarButtonItem() {
        sut.didTapRightBarButton()
        
        XCTAssertTrue(viewController.isCalledPresentToReviewWriteViewController)
    }
}
