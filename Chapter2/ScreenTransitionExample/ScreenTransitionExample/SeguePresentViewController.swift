//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 박진우 on 2021/09/26.
//

import UIKit

class SeguePresentViewController: UIViewController {
    // Present를 Full Screen으로 변경
    // - 해당 Segue 선택 후, Presentation을 Full Screen으로 변경
    // Present를 Modal로 변경
    // - 해당 Segue 선택 후, Presentation을 Same As Destination
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
