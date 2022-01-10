//
//  BeerDetailViewController.swift
//  Brewery
//
//  Created by 박진우 on 2022/01/04.
//

import UIKit

class BeerDetailViewController: UITableViewController {
    
    var beer: Beer?
    
    private let headerList = ["ID", "Description", "Brewers Tips", "Food Paring"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = beer?.name ?? "Noname"
        
        tableView = UITableView(frame: tableView.frame, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BeerDetailListCell")
        tableView.rowHeight = UITableView.automaticDimension
        
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        let headerView = UIImageView(frame: frame)
        let imageURL = URL(string: beer?.imageURL ?? "")
        
        headerView.contentMode = .scaleAspectFit
        headerView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "beer_icon"))
        
        tableView.tableHeaderView = headerView
    }
}

// UITableView DataSource, Delegate
extension BeerDetailViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 3:
            return beer?.foodPairing?.count ?? 0
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 3:
            let isFoodPairingEmpty = beer?.foodPairing?.isEmpty ?? true
            return isFoodPairingEmpty ? nil : headerList[3]
        default:
            return headerList[section]
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "BeerDetailListCell")
        
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0: // ID
            cell.textLabel?.text = String(describing: beer?.id ?? 0)
        case 1: // Description
            cell.textLabel?.text = beer?.description ?? "No Description"
        case 2: // Brewers Tips
            cell.textLabel?.text = beer?.brewersTips ?? "No Tips"
        case 3: // Food Paring
            cell.textLabel?.text = beer?.foodPairing?[indexPath.row] ?? ""
        default:
            print("default")
        }
        
        return cell
    }
}
