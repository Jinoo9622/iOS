//
//  ReviewWritePresenterTests.swift
//  BookReviewTests
//
//  Created by 박진우 on 2022/07/15.
//

import XCTest
@testable import BookReview

class ReviewWritePresenterTests: XCTestCase {
    var sut: ReviewWritePresenter!
    var viewController: MockReviewWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = ReviewWritePresenter(
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
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_didTapLeftBarButton() {
        sut.didTapLeftBarButton()
        
        XCTAssertTrue(viewController.isCalledShowCloseAlertController)
    }
    
    // case별로 분기하여 test 작성: start
    func test_didTapRightBarButton_Book_ContentsText() {
        sut.book = Book(title: "Swift", imageURL: "")
        
        sut.didTapRightBarButton(contentsText: "공부하기 좋네여.")
        
        XCTAssertTrue(userDefaultsManager.isCalledSetReview)
        XCTAssertTrue(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButtonFail_NoBook() {
        sut.book = nil
        sut.didTapRightBarButton(contentsText: "공부하기 좋네여.")
        
        XCTAssertFalse(userDefaultsManager.isCalledSetReview)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButtonFail_ContentsTextIsNil() {
        sut.book = Book(title: "Swift", imageURL: "")
        sut.didTapRightBarButton(contentsText: nil)
        
        XCTAssertFalse(userDefaultsManager.isCalledSetReview)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButtonFail_PlaceHolder() {
        sut.book = Book(title: "Swift", imageURL: "")
        sut.didTapRightBarButton(contentsText: "내용을 입력해주세요.")
        
        XCTAssertFalse(userDefaultsManager.isCalledSetReview)
        XCTAssertFalse(viewController.isCalledClose)
    }
    // case별로 분기하여 test 작성: start: end
    
    func test_didTapBookTitleButton() {
        sut.didTapBookTitleButton()
        
        XCTAssertTrue(viewController.isCalledPresentToSearchBookViewController)
    }
}
