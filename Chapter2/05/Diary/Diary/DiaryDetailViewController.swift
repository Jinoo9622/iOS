//
//  DiaryDetailViewController.swift
//  Diary
//
//  Created by 박진우 on 2021/11/09.
//

import UIKit

// delegate 사용 시, 1:1 로만 데이터 전달이 가능 (diaryListVC <-> diaryDetailVC / starVC <-> diaryDetailVC)
// => 1:N 데이터 전달: NotificationCenter 이용
/*
protocol DiaryDetailViewDelegate: AnyObject {
    func didSelectDelete(indexPath: IndexPath)  // diary가 삭제될 경우, list 화면에 indexPath를 전달하여, list에서 해당 diary 삭제
    func didSelectStar(indexPath: IndexPath, isStar: Bool)  // 즐겨찾기 버튼 tap시, 해당 값 전달
}
*/

class DiaryDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
//    weak var delegate: DiaryDetailViewDelegate?
    var starButton: UIBarButtonItem?
    
    var diary: Diary?
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()    // 일기 내용 표시
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(starDiaryNotification(_:)),
            name: NSNotification.Name("starDiary"),
            object: nil
        )
    }
    
    private func configureView() {
        guard let diary = self.diary else { return }
        self.titleLabel.text = diary.title
        self.contentsTextView.text = diary.contents
        self.dateLabel.text = self.dateToString(date: diary.date)
        self.starButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(tapStarButton))
        self.starButton?.image = diary.isStar ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        self.starButton?.tintColor = .orange
        self.navigationItem.rightBarButtonItem = self.starButton
    }
    
    @objc func editDiaryNotification(_ notification: NSNotification) {
        guard let diary = notification.object as? Diary else { return }
        self.diary = diary
        self.configureView()
    }
    
    @objc func starDiaryNotification(_ notification: NSNotification) {
        guard let starDiary = notification.object as? [String: Any] else { return }
        guard let isStar = starDiary["isStar"] as? Bool else { return }
        guard let uuidString = starDiary["uuidString"] as? String else { return }
        guard let diary = self.diary else { return }
        if diary.uuidString == uuidString {
            self.diary?.isStar = isStar
            self.configureView()
        }
    }
    
    @IBAction func tapEditButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "WriteDiaryViewController") as? WriteDiaryViewController else { return }
        guard let indexPath = self.indexPath else { return }
        guard let diary = self.diary else { return }
        viewController.diaryEditorMode = .edit(indexPath, diary)
        // Notication observe
        // - observer: observe할 instance
        // - selector: 이벤트 발생 시, 처리할 method
        // - name: observe할 notification name
        // - object: observer에게 notification을 보낼 object
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(editDiaryNotification(_:)),
            name: NSNotification.Name("editDiary"),
            object: nil
        )
        // 수정버튼 탭 -> 일기작성 화면으로 이동
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapDeleteButton(_ sender: Any) {
        guard let uuidString = self.diary?.uuidString else { return }
//        self.delegate?.didSelectDelete(indexPath: indexPath)
        // 일기장 tab과 즐겨찾기 tab의 diaryList 갯수가 다를 경우, indexPath로 해당 일기장 삭제 시, out of range error 발생 가능
        // => 각 일기장 객체에 uuid를 추가하여 uuid 값으로 삭제
        NotificationCenter.default.post(
            name: NSNotification.Name("deleteDiary"),
            object: uuidString,
            userInfo: nil
        )
        self.navigationController?.popViewController(animated: true)
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    @objc func tapStarButton() {
        guard let isStar = self.diary?.isStar else { return }
        if isStar {
            self.starButton?.image = UIImage(systemName: "star")
        } else {
            self.starButton?.image = UIImage(systemName: "star.fill")
        }
        self.diary?.isStar = !isStar
        NotificationCenter.default.post(
            name: NSNotification.Name("starDiary"),
            object: [
                "diary": self.diary,
                "isStar": self.diary?.isStar ?? false,
                "uuidString": diary?.uuidString
            ],
            userInfo: nil
        )
//        self.delegate?.didSelectStar(indexPath: indexPath, isStar: self.diary?.isStar ?? false)
    }
    
    deinit {
        // instance가 deinit되는 경우, observer 제거
        NotificationCenter.default.removeObserver(self)
    }
}
