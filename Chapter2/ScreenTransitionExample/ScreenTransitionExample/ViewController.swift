//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 박진우 on 2021/09/26.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController 뷰가 로드됨. - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController 뷰가 나타날 것. - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController 뷰가 나타남. - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController 뷰가 사라질 것. - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController 뷰가 사라짐. - viewDidDisappear")
    }

    @IBAction func tapCodePushButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") as? CodePushViewController else {
            print("There is no instantiated ViewController - CodePushViewController")
            return
        }
        viewController.name = "Jinu"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") as? CodePresentViewController else {
            print("There is no instantiated ViewController - CodePresentViewController")
            return
        }
        // Full Screen으로 present할 경우
        // viewController.modalPresentationStyle = .fullScreen
        // 그 이외는 UIModalPresentationStyle에서 확인 ㅇㅇ
        viewController.name = "Jinu"
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }

    // segueway 실행 직전에 자동으로 실행되는 함수 ㅇㅇ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController {
            viewController.name = "Jinu from ViewController(prepare)"
        }
    }
    
    func sendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

