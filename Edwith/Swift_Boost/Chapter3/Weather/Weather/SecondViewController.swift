//
//  SecondViewController.swift
//  Weather
//
//  Created by 박진우 on 2020/07/12.
//  Copyright © 2020 박진우. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let weatherCellIdentifier: String = "weatherCell"
    var textCountry: String?
    var textAsset: String!
    var weathers: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = textCountry
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: self.textAsset) else {
            return
        }
        
        do {
            self.weathers = try jsonDecoder.decode([Weather].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherCell = tableView.dequeueReusableCell(withIdentifier: self.weatherCellIdentifier, for: indexPath) as! WeatherCell
        let weather: Weather = weathers[indexPath.row]
        
        // 날씨 이미지 set
        switch weather.state {
        case 10:
            cell.weatherImage.image = UIImage(named: "sunny")
        case 11:
            cell.weatherImage.image = UIImage(named: "cloudy")
        case 12:
            cell.weatherImage.image = UIImage(named: "rainy")
        case 13:
            cell.weatherImage.image = UIImage(named: "snowy")
        default:
            cell.weatherImage.image = UIImage(named: "sunny")
        }
        
        // 도시 text set
        cell.cityLabel.text = weather.cityName
        
        // 섭씨/화씨 set
        cell.celLabel.text = weather.temperature
        // text color set (10도 이하일 경우 파란색)
        if weather.celsius <= 10 {
            cell.celLabel.textColor = .blue
        } else {
            cell.celLabel.textColor = .black
        }
        
        // 강수확률 set
        cell.rainPropertyLabel.text = weather.rainFall
        // text color set (50% 이상일 경우 주황색)
        if weather.rainfallProbability >= 50 {
            cell.rainPropertyLabel.textColor = .orange
        } else {
            cell.rainPropertyLabel.textColor = .black
        }
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
