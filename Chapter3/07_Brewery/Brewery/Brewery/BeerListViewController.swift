//
//  BeerListViewController.swift
//  Brewery
//
//  Created by 박진우 on 2022/01/04.
//

import UIKit

class BeerListViewController: UITableViewController {
    
    var beerList = [Beer]()
    var dataTasks = [URLSessionTask]()
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UINavigationBar
        title = "Brewery"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // UITableView 설정
        tableView.register(BeerListCell.self, forCellReuseIdentifier: "BeerListCell")
        tableView.rowHeight = 150
        tableView.prefetchDataSource = self
        
        fetchBeer(of: currentPage)
    }
}

// UITableView DataSource, Delegate
extension BeerListViewController: UITableViewDataSourcePrefetching {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as? BeerListCell else {
            return UITableViewCell()
        }
        let beer = beerList[indexPath.row]
        cell.configure(with: beer)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beerList[indexPath.row]
        let detailViewController = BeerDetailViewController()
        
        detailViewController.beer = selectedBeer
        navigationController?.show(detailViewController, sender: nil)
    }
    // 현재 화면에는 보이지 않으나, 보여질 예정인 row들의 데이터를 불러올수 있음 (상/하, 좌/우)
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        // 첫번째 page는 prefetch X
        guard currentPage != 1 else { return }
        
        indexPaths.forEach {
            if ($0.row + 1)/25 + 1 == currentPage {
                self.fetchBeer(of: currentPage)
            }
        }
    }
}

// Data Fetching
private extension BeerListViewController {

    func fetchBeer(of page: Int) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)"),
              // 이전에 요청한 url인 경우, data fetch X
              dataTasks.firstIndex(where: { $0.originalRequest?.url == url }) == nil else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard error == nil,
                  let self = self,
                  let response = response as? HTTPURLResponse,
                  let data = data,
                  let beers = try? JSONDecoder().decode([Beer].self, from: data) else {
                print("ERROR: URLSession data task error \(error?.localizedDescription)")
                return
            }
            
            switch response.statusCode {
            case 200..<300: // Success
                // 새로 data fetch시, beerList에 append
                self.beerList.append(contentsOf: beers)
                self.currentPage += 1
                // UI 변경은 main thread에서 실행해야함
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case 400..<500: // Client Error
                print("""
                    ERROR: Client Error \(response.statusCode)
                    Response: \(response)
                """)
            case 500..<600:  // Server Error
                print("""
                    ERROR: Server Error \(response.statusCode)
                    Response: \(response)
                """)
            default:
                print("""
                    ERROR: Error \(response.statusCode)
                    Response: \(response)
                """)
            }
        }
        dataTask.resume()
        dataTasks.append(dataTask)
    }
}
