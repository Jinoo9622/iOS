//
//  ViewController.swift
//  Weather
//
//  Created by 박진우 on 2020/07/12.
//  Copyright © 2020 박진우. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let countryCellIdentifier: String = "countryCell"
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryCell = tableView.dequeueReusableCell(withIdentifier: self.countryCellIdentifier, for: indexPath) as! CountryCell
        let country: Country = countries[indexPath.row]
        cell.countryImage.image = UIImage(named: "flag_\(country.assetName)")
        cell.countryLabel.text = "\(country.koreanName)"
        cell.koreanName = country.koreanName
        cell.assetName = country.assetName
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: CountryCell = sender as? CountryCell else {
            return
        }

        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        print("\(indexPath)")
        
//        nextViewController.textCountry = cell.koreanName
//        nextViewController.textAsset = cell.assetName
        nextViewController.textCountry = countries[indexPath[1]].koreanName
        nextViewController.textAsset = countries[indexPath[1]].assetName
    }
    
}

