//
//  AlertListViewController.swift
//  DrinkAlarm
//
//  Created by 박진우 on 2021/12/18.
//

import UIKit
import UserNotifications

class AlertListViewController: UITableViewController {
    
    var alerts: [Alert] = []
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "AlertListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "AlertListCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        alerts = alertList()
        
    }
    
    @IBAction func addAlertButtonAction(_ sender: Any) {
        guard let addAlertVC = storyboard?.instantiateViewController(identifier: "AddAlertViewController") as? AddAlertViewController else { return }
        
        addAlertVC.pickedDate = { [weak self] date in
            guard let self = self else { return }
            
            let newAlert = Alert(date: date, isOn: true)
            var alertList = self.alertList()
            
            alertList.append(newAlert)
            alertList.sort { $0.date < $1.date }
            
            self.alerts = alertList
            // 임의의 객채이기에 저장시 PropertyListEncoder를 이용하여 encoding
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            self.userNotificationCenter.addNotificationRequest(by: newAlert)
            self.tableView.reloadData()
        }
        
        self.present(addAlertVC, animated: true, completion: nil)
    }
    
    func alertList() -> [Alert] {
        // UserDefault에는 PropertyList로 저장됨 -> [Alert] 형태(custom struct)로 return하기 위해 decoding
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              let alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return [] }
        return alerts
    }
}

// UITableView Datasource, Delegate
extension AlertListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alerts.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "🚰 물마실 시간"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as? AlertListCell else {
            return UITableViewCell()
        }
        
        cell.alertSwitch.isOn = alerts[indexPath.row].isOn
        cell.timeLabel.text = alerts[indexPath.row].time
        cell.meridiemLabel.text = alerts[indexPath.row].meridiem
        // 각 cell이 자신의 index를 갖게하기 위해 tag 값 추가
        cell.alertSwitch.tag = indexPath.row
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            // Delete Notification
            self.alerts.remove(at: indexPath.row)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.alerts), forKey: "alerts")
            self.userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alerts[indexPath.row].id])
            self.tableView.reloadData()
        default:
            break
        }
    }
}
