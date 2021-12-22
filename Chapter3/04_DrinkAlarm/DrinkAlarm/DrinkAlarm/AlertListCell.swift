//
//  AlertListCell.swift
//  DrinkAlarm
//
//  Created by 박진우 on 2021/12/18.
//

import UIKit
import UserNotifications

class AlertListCell: UITableViewCell {
    
    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alertSwitch: UISwitch!
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              var alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return }
        
        alerts[sender.tag].isOn = sender.isOn
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "alerts")
        
        if sender.isOn {
            self.userNotificationCenter.addNotificationRequest(by: alerts[sender.tag])
        } else {
            self.userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[sender.tag].id])
        }
    }
}
