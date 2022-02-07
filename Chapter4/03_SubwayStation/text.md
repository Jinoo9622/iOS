## UISearchController
- search bar와의 interaction을 통하여 화면의 검색결과를 관리하는 ViewController
- UISearchBar: 

- 사용법  
  1. UINavigationController 생성
  2. UISearchController 생성
  3. navigationController의 navigationItem에 생성한 searchController 설정 <br>

  ```swift
  ...
  override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "지하철 도착 정보"
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "지하철 역을 입력해주세요."
        searchController.obscuresBackgroundDuringPresentation = false
        
        navigationItem.searchController = searchController
  }
  ...
  ```
