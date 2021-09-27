//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 박진우 on 2021/09/26.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    // delegate 패턴 사용 시, 해당 변수는 weak로 선언,,,
    // => 없을 경우, 메모리 누수가 발생 가능하기에,,,
    weak var delegate: SendDataDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        // data를 전달받은 viewController에서 SendDataDelegate 채택 시, 해당 viewController에서 sendData 실행 ㅇㅇ
        self.delegate?.sendData(name: "Jinu from CodePresentViewController")
        self.dismiss(animated: true, completion: nil)
    }
}
