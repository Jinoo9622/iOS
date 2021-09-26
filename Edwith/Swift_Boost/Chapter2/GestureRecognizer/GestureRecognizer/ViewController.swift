//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by A on 2020/06/14.
//  Copyright © 2020 binu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(gestureRecognizer:)))
        
        self.view.addGestureRecognizer(tapRecognizer)
    }

    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        print("Tapped!!!")
    }
    
}

