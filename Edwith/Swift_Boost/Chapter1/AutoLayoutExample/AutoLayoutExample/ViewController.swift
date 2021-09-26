//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by A on 2020/05/30.
//  Copyright © 2020 binu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var constraintX: NSLayoutConstraint
        constraintX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        var constraintY: NSLayoutConstraint
        constraintY = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        constraintX.isActive = true
        constraintY.isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonConstraintX: NSLayoutConstraint
        buttonConstraintX = label.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        
        var topConstraintY: NSLayoutConstraint
        topConstraintY = label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10)
        
        buttonConstraintX.isActive = true
        topConstraintY.isActive = true
        
        var widthConstraint: NSLayoutConstraint
        widthConstraint = label.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 2.0)
        
        label.backgroundColor = UIColor.brown
        button.backgroundColor = UIColor.red
        
        widthConstraint.isActive = true
    }


}

