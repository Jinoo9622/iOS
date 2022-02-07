## UISearchController
- search bar와의 interaction을 통하여 화면의 검색결과를 관리하는 ViewController
- UISearchBar: 

- 사용법  
  1. UINavigationController 생성
  2. UISearchController 생성
  3. navigationController의 navigationItem에 생성한 searchController 설정 
  <br>
  
    ```swift
    override func viewDidLoad() {
          super.viewDidLoad()

          navigationController?.navigationBar.prefersLargeTitles = true
          navigationItem.title = "지하철 도착 정보"

          let searchController = UISearchController()
          searchController.searchBar.placeholder = "지하철 역을 입력해주세요."
          searchController.obscuresBackgroundDuringPresentation = false   // search bar에 focus가 있는 경우, 검색결과 영역 (search bar 하단의 딤처리 여부)

          navigationItem.searchController = searchController
    }
    ```
    
     ※ UISearchController의 obscuresBackgroundDuringPresentation = true인 경우, iOS 15 이상부터는 search bar 영역까지 딤처리됨
      
      ![image](https://user-images.githubusercontent.com/46417892/152761916-42894001-fd7b-44d8-904a-29561baef30e.png)

