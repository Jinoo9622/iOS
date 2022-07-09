//
//  TranslateViewController.swift
//  Translator
//
//  Created by 박진우 on 2022/06/18.
//

import UIKit
import SnapKit

final class TranslateViewController: UIViewController {
    
    private var translatorManager = TranslatorManager()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        
        [sourceLanguageButton, targetLanguageButton]
            .forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var sourceLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle(translatorManager.sourceLanguage.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        button.addTarget(self, action: #selector(didTapSourceLanguageButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var targetLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle(translatorManager.targetLanguage.title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        button.addTarget(self, action: #selector(didTapTargetLanguageButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var resultBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23.0, weight: .bold)
        label.textColor = .mainTintColor
        label.text = "HELLO"
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.addTarget(self, action: #selector(didTapBookmarkButton), for: .touchUpInside)
        
        return button
    }()

    
    @objc func didTapBookmarkButton() {
        guard let sourceText = sourceLabel.text,
              let translatedText = resultLabel.text,
              bookmarkButton.imageView?.image == UIImage(systemName: "bookmark")    // bookmark.fill == 북마크가 된상태
        else { return }
        
        bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        
        // UserDefaults에 저장하는 타이밍
        let currentBookmarks: [Bookmark] = UserDefaults.standard.bookmarks
        let newBookmark = Bookmark(
            sourceLanguage: self.translatorManager.sourceLanguage,
            translatedLanguage: self.translatorManager.targetLanguage,
            sourceText: sourceText,
            translatedText: translatedText
        )
        UserDefaults.standard.bookmarks = [newBookmark] + currentBookmarks  // 신규값(최신값을) 0번째로
        
        print(UserDefaults.standard.bookmarks)
    }
    
    private lazy var copyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.addTarget(self, action: #selector(didTapCopyButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func didTapCopyButton() {
        // 클립보드에 복사
        UIPasteboard.general.string = resultLabel.text
    }
    
    private lazy var sourceLabelBaseButton: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSourceLabelBaseButton))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    private lazy var sourceLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Enter_Text", comment: "텍스트 입력")
        label.textColor = .tertiaryLabel
        // sourceLabel에 입력값이 추가되면, placeholder 스타일 해제
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 23.0, weight: .semibold)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .secondarySystemBackground
        
        setupViews()
    }
}

extension TranslateViewController: SourceTextViewControllerDelegate {
    func didEnterText(_ sourceText: String) {
        guard !sourceText.isEmpty else { return }
        
        sourceLabel.text = sourceText
        sourceLabel.textColor = .label
        
        translatorManager.translate(from: sourceText) { [weak self] translatedText in
            self?.resultLabel.text = translatedText
        }
        
        // 신규값 입력 시, bookmark button 초기화
        bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
}

private extension TranslateViewController {
    func setupViews() {
        [
            buttonStackView,
            resultBaseView,
            resultLabel,
            bookmarkButton,
            copyButton,
            sourceLabelBaseButton,
            sourceLabel
        ]
            .forEach { view.addSubview($0) }
        
        let defaultSapcing: CGFloat = 16.0
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(defaultSapcing)
            $0.height.equalTo(50.0)
        }
        
        resultBaseView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(buttonStackView.snp.bottom).offset(defaultSapcing)
            $0.bottom.equalTo(bookmarkButton).offset(defaultSapcing)    // TODO: 컨텐츠 사이즈에 맞게 가변높이로 변경
        }
        
        resultLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalTo(resultBaseView).inset(24.0)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.leading.equalTo(resultLabel)
            $0.top.equalTo(resultLabel.snp.bottom).offset(24.0)
            $0.width.height.equalTo(40.0)
        }
        
        copyButton.snp.makeConstraints {
            $0.leading.equalTo(bookmarkButton.snp.trailing).inset(8.0)
            $0.top.equalTo(bookmarkButton)
            $0.width.height.equalTo(40.0)
        }
        
        sourceLabelBaseButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(resultBaseView.snp.bottom).offset(defaultSapcing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        sourceLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalTo(sourceLabelBaseButton).inset(24.0)
        }
    }
    
    @objc func didTapSourceLabelBaseButton() {
        let viewController = SourceTextViewController(delegate: self)
        present(viewController, animated: true)
    }
    
    @objc func didTapSourceLanguageButton() {
        didTapLanguageButton(type: .source)
    }

    @objc func didTapTargetLanguageButton() {
        didTapLanguageButton(type: .target)
    }
    
    func didTapLanguageButton(type: Type) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        Language.allCases.forEach { language in
            let action = UIAlertAction(title: language.title, style: .default) { [weak self] _ in
                switch type {
                case .source:
                    self?.translatorManager.sourceLanguage = language
                    self?.sourceLanguageButton.setTitle(language.title, for: .normal)
                case .target:
                    self?.translatorManager.targetLanguage = language
                    self?.targetLanguageButton.setTitle(language.title, for: .normal)
                }
            }
            alertController.addAction(action)
        }

        let cancelAction = UIAlertAction(
            title: NSLocalizedString("Cancel", comment: "취소하기"),
            style: .cancel,
            handler: nil
        )
        alertController.addAction(cancelAction)

        present(alertController, animated: true)
    }
    
//    @objc func didTapLanguageButton(_ button: UIButton) {
//        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        Language.allCases.forEach { language in
//            let action = UIAlertAction(title: language.title, style: .default) { [weak self] _ in
//                guard let self = self else { return }
//                // ※ 각각의 버튼별로 selector 추가하고, 공통 함수를 type별로 분기하는 방법도 있음
//                if button == self.sourceLanguageButton {
//                    self.sourceLanguage = language
//                    self.sourceLanguageButton.setTitle(language.title, for: .normal)
//                }
//
//                if button == self.targetLanguageButton {
//                    self.targetLanguage = language
//                    self.targetLanguageButton.setTitle(language.title, for: .normal)
//                }
//            }
//            alertController.addAction(action)
//        }
//
//        let cancelAction = UIAlertAction(title: "취소하기", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//
//        present(alertController, animated: true)
//    }
}
