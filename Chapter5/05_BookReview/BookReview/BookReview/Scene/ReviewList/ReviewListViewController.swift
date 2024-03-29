//
//  ReviewListViewController.swift
//  BookReview
//
//  Created by 박진우 on 2022/07/10.
//

import UIKit
import SnapKit

final class ReviewListViewController: UIViewController {

    private lazy var presenter = ReviewListPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // presenter에 의해 setupNavigationBar가 실행됨.
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
}

extension ReviewListViewController: ReviewListProtocol {
    func setupNavigationBar() {
        navigationItem.title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapRightBarButton)
        )
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func presentToReviewWriteViewController() {
        let vc = UINavigationController(rootViewController: ReviewWriteViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func reloadTableView() {
        tableView.reloadData()
        
        print("reloadTableView!!!")
    }
}

extension ReviewListViewController {
    @objc func didTapRightBarButton() {
        presenter.didTapRightBarButton()    // = presentToReviewWriteViewController()
    }
}

extension ReviewListViewController: UITableViewDelegate {
    
}
