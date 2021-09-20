//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by 박진우 on 2021/09/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapChangeColorButton(_ sender: UIButton) {
        self.colorView.backgroundColor = .blue
        print("Change color button clicked!!")
    }
    
}

