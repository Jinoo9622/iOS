//
//  FeedViewController.swift
//  Outstagram
//
//  Created by 박진우 on 2022/02/13.
//

import UIKit
import SnapKit
import Photos

class FeedViewController: UIViewController {
    
    private lazy var tableView: UITableView = { // Dynamic height cell을 구현하기위해, CollectionView가 아닌 TableView로 구현
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self
        //tableView.delegate = self
        
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
        
        return tableView
    }()
    
    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        return imagePickerController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
    }    
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setup()
        
        return cell
    }
}

// UIImagePickerControllerDelegate 사용 시, 반드시 UINavigationControllerDelegate을 따르도록 추가
extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // ImagePicker에서 media 선택 후, 실행되는 method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImage = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = originalImage
        }
        
        picker.dismiss(animated: true) { [weak self] in
            let uploadViewController = UploadViewController(uploadImage: selectedImage ?? UIImage())
            let navigationController = UINavigationController(rootViewController: uploadViewController)
            navigationController.modalPresentationStyle = .fullScreen
            
            self?.present(navigationController, animated: true)
        }
    }
}

private extension FeedViewController {
    func setupNavigationBar() {
        navigationItem.title = "Outstagram"
        
        let uploadButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: self,
            action: #selector(didTapUploadButton(_:))
        )
        navigationItem.rightBarButtonItem = uploadButton
    }
    
    @objc func didTapUploadButton(_ sender: UIBarButtonItem) {
        // 앨범 접근 권한 확인 후, 앨범 접근
//        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [weak self] status in
//            guard let self = self else { return }
//            switch status {
//            case .authorized:
//                print("앨범 접근 권한 허용")
//                DispatchQueue.main.async {
//                    self.present(self.imagePickerController, animated: true)
//                }
//            case .denied:
//                print("앨범 접근 권한 거부")
//            case .notDetermined, .restricted:
//                print("앨범 접근 권한 미정")
//            default:
//                print("default")
//            }
//        }
        checkPhotoLibraryAuthorization { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.present(self.imagePickerController, animated: true)
            }
        }
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func checkPhotoLibraryAuthorization(completion: @escaping () -> Void) {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            switch status {
            case .authorized:
                completion()
                print("앨범 접근 권한 허용")
            case .denied:
                print("앨범 접근 권한 거부")
            case .notDetermined, .restricted:
                print("앨범 접근 권한 미정")
            default:
                print("default")
            }
        }
    }
}

