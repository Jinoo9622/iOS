//
//  BookmarkListViewController.swift
//  Translator
//
//  Created by 박진우 on 2022/07/03.
//

import UIKit
import SnapKit

final class BookmarkListViewController: UIViewController {
    private var bookmark: [Bookmark] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        // layout.scrollDirection = .vertical -> default: vertical
        
        let inset: CGFloat = 16.0
        layout.estimatedItemSize = CGSize(width: view.frame.width - (inset * 2), height: 100.0)
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layout.minimumLineSpacing = inset
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.register(
            BookmarkCollectionViewCell.self,
            forCellWithReuseIdentifier: BookmarkCollectionViewCell.identifier
        )
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NSLocalizedString("Bookmark", comment: "즐겨찾기")
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.bookmark = UserDefaults.standard.bookmarks
        self.collectionView.reloadData()
    }
}

extension BookmarkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.bookmark.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookmarkCollectionViewCell.identifier, for: indexPath) as? BookmarkCollectionViewCell else { return UICollectionViewCell() }
        cell.setup(from: bookmark[indexPath.row])
        
        return cell
    }
}

private extension BookmarkListViewController {
    func setupLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
