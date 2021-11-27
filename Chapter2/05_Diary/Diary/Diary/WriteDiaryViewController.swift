//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by 박진우 on 2021/11/09.
//

import UIKit

// viewController의 상태 값
enum DiaryEditorMode {
    case new    // 신규생성
    case edit(IndexPath, Diary) // 수정
}

protocol WriteDiaryViewDelegate: AnyObject {
    // diary 객체를 전달하기위한 protocol
    func didSelectRegister(diary: Diary)
}
class WriteDiaryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!     // 제목
    @IBOutlet weak var contentsTextView: UITextView!    // 내용
    @IBOutlet weak var dateTextField: UITextField!      // 날짜
    @IBOutlet weak var confirmButton: UIBarButtonItem!  // 등록버튼
    
    private let datePicker = UIDatePicker()     // datepicker 객체 생성
    private var diaryDate: Date?    // datepicker에서 선택한 날짜를 저장할 property
    weak var delegate: WriteDiaryViewDelegate?
    var diaryEditorMode: DiaryEditorMode = .new     // viewController의 상태값을 저장 (default = new)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.configureInputField()
        self.configureEditMode()
        self.confirmButton.isEnabled = false
    }
    // diaryEditorMode에 따른 변수 setting
    private func configureEditMode() {
        switch self.diaryEditorMode {
        case let .edit(_, diary):
            self.titleTextField.text = diary.title
            self.contentsTextView.text = diary.contents
            self.dateTextField.text = dateToString(date: diary.date)
            self.diaryDate = diary.date
            self.confirmButton.title = "수정"
        default:
            break
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    // 내용 textView UI 설정
    private func configureContentsTextView() {
        // 각 parameter들은 0.0 ~ 1.0 사이의 값을 넣기에, rgb에 설정하는 값을 255로 나눔
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
//        UIColor.systemGray2.cgColor
        self.contentsTextView.layer.borderColor = borderColor.cgColor   // layer 관련 색상 설정 시, UIColor가 아닌 CGColor로 설정
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
    }
    // datePicker UI 및 기능 설정
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        self.datePicker.locale = Locale(identifier: "ko_KR")    // datepicker가 한국어로 표시되도록 설정
        self.dateTextField.inputView = self.datePicker          // keyboard 대신, datepicker가 나오도록 설정
    }
    // textField(제목, 날짜)의 기능 설정 - 내용 변경 시, 등록버튼 활성여부 판단
    private func configureInputField() {
        self.contentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contentsTextView.text else { return }
        guard let date = self.diaryDate else { return }

        
        switch self.diaryEditorMode {
        case .new:
            // 등록버튼 클릭 시, diary 객체 전달 및 vc pop
            let diary = Diary(
                uuidString: UUID().uuidString,
                title: title,
                contents: contents,
                date: date,
                isStar: false
            )
            self.delegate?.didSelectRegister(diary: diary)
        case let .edit(indexPath, diary):
            // NotificationCenter의 post method를 이용하여 수정된 diary 객체 전달
            // - name: notification의 이름, 해당 값을 가지고 observer가 이벤트 발생을 확인
            // - object: 전달할 객체
            // - usetInfo: notification과 관련된 값을 전달
            let diary = Diary(
                uuidString: diary.uuidString,
                title: title,
                contents: contents,
                date: date,
                isStar: diary.isStar
            )
            NotificationCenter.default.post(
                name: NSNotification.Name("editDiary"),
                object: diary,
                userInfo: nil
            )
        default:
            break
        }
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formatter = DateFormatter()     // date fomatter : date type <-> string type
        formatter.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formatter.string(from: datePicker.date)
        // dateTextField의 경우, datepicker의 값이 변해도 editingChanged 이벤트가 발생하지 않기에, datepicker의 값 변경 시, editingChanged 전달
        self.dateTextField.sendActions(for: .editingChanged)
    }
    
    @objc private func titleTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }

    // User가 화면을 터치하면 호출되는 메서드 - 빈화면 터치 시, keyboard 및 datepicker가 내려가도록 설정
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func validateInputField() {
        // 제목, 내용, 날짜 입력 완료시에만 등록버튼 활성화
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
}

extension WriteDiaryViewController: UITextViewDelegate {
    // text view에 text가 입력될 때마다 호출
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
