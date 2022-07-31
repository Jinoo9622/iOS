//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by 박진우 on 2022/07/10.
//

import Foundation

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func showCloseAlertController()
    func close()
    func setupViews()
    func presentToSearchBookViewController()
    func updateViews(title: String, imageURL: URL?)
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    var book: Book?
    
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요."
    
    init(viewController: ReviewWriteProtocol, userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func didTapLeftBarButton() {
        viewController.showCloseAlertController()
    }
    
    func didTapRightBarButton(contentsText: String?) {
        // TODO: UserDefaults에 유저가 작성한 도서리뷰 저장하기
        guard let book = book,
              let contentsText = contentsText,
              contentsText != contentsTextViewPlaceHolderText else { return }
        
        let bookReview = BookReview(
            title: book.title,
            contents: contentsText,
            imageURL: book.imageURL
        )
        
        userDefaultsManager.setReview(bookReview)
        
        viewController.close()
    }
    
    func didTapBookTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectBook(_ book: Book) {
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
        self.book = book
    }
}
