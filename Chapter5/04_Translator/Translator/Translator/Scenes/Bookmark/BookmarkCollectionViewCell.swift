//
//  BookmarkCollectionViewCell.swift
//  Translator
//
//  Created by 박진우 on 2022/07/03.
//

import UIKit
import SnapKit

final class BookmarkCollectionViewCell: UICollectionViewCell {
    static let identifier = "BookmarkCollectionViewCell"
    
    private var sourceBookmarkTextStackView: BookmarkTextStackView!
    private var targetBookmarkTextStackView: BookmarkTextStackView!
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        let inset = 16.0
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = inset
        
        stackView.layoutMargins = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        return stackView
    }()
    
    func setup(from bookmark: Bookmark) {
        backgroundColor = .systemBackground
        layer.cornerRadius = 12.0
        
        sourceBookmarkTextStackView = BookmarkTextStackView(
            language: bookmark.sourceLanguage,
            text: bookmark.sourceText,
            type: .source
        )
        targetBookmarkTextStackView = BookmarkTextStackView(
            language: bookmark.translatedLanguage,
            text: bookmark.translatedText,
            type: .target
        )
        
        // stackview cell이 reuse 잘 되도록 기존 subview 삭제 후, 다시 추가
        stackView.subviews
            .forEach { $0.removeFromSuperview() }
        [sourceBookmarkTextStackView, targetBookmarkTextStackView]
            .forEach { stackView.addArrangedSubview($0) }
        
        self.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width - 32.0)
        }
        
        layoutIfNeeded()
    }
}
