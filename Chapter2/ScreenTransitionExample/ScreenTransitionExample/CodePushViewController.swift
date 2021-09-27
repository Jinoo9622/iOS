//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 박진우 on 2021/09/26.
//

import UIKit

class CodePushViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()  // root view controller에서 넘어온 name data길에에 맞게 label size 설정 ㅇㅇ
        }
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
