//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by 박진우 on 2022/07/10.
//

import UIKit
import SnapKit

final class SearchBookViewController: UIViewController {
    private lazy var presenter = SearchBookPresenter(
        viewController: self,
        delegate: searchBookDelegate
    )
    
    private let searchBookDelegate: SearchBookDelegate
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = presenter
        tableView.dataSource = presenter
        
        return tableView
    }()
    
    init(searchBookDelegate: SearchBookDelegate) {
        self.searchBookDelegate = searchBookDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension SearchBookViewController: SearchBookProtocol {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let searchController = UISearchController()
        // searchBar 활성화 시, 하단 background의 딤처리 여부
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = presenter
        
        navigationItem.searchController = searchController
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dismiss() {
        navigationItem.searchController?.dismiss(animated: true)    // search result를 2번 클릭해야하는 인터렉션 보완을 위해 추가
        dismiss(animated: true)
    }
    
    func reloadView() {
        tableView.reloadData()
    }
}
