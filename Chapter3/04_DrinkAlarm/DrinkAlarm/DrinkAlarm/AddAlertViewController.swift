//
//  AddAlertViewController.swift
//  DrinkAlarm
//
//  Created by 박진우 on 2021/12/18.
//

import UIKit

class AddAlertViewController: UIViewController {
    
    var pickedDate: ((_ date: Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
}
