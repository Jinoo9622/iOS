## UITableView
- 데이터들을 목록 형태로 보여줄 수 있는 가장 기본적인 UI 컴포넌트
- UIScrollView를 상속받기에, scroll 가능 
- 여러 개의 Cell을 가지고 있고, 하나의 열과 여러줄의 행을 지니고 있으며, 수직으로만 스크롤 가능
- 섹션을 이용해 행을 그룹화하여 콘텐츠를 좀 더 쉽게 탐색할 수 있음
- 섹션의 헤더와 푸터에 View를 구성하여 추가적인 정보를 표시할 수 있음

### UITableViewDelegate / UITableViewDataSource
- UITableViewDelegate
  - 
- UITableViewDataSource
  - 테이블 뷰를 생성하고 수정하는데 필요한 정보를 테이블 뷰 객체에 제공
  - UITableViewDataSource protocol 채택 시, **필수적으로 구현**해야하는 함수
  ```swift
  // 각 세션에 표시할 행의 개수를 묻는 메서드
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  
  // 특정 인덱스 Row의 Cell에 대한 정보를 넣어 Cell을 반환하는 메서드
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  ```
  - optional func
  ```swift
  // 총 섹션 개수를 묻는 메서드
  optional func numberOfSections(in tableView: UITableView) -> Int
  
  // 특정 세션의 헤더 타이틀을 묻는 메서드
  optional func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
  
  // 특정 세션의 푸터 타이틀을 묻는 메서드
  optional func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?
  
  // 특정 위치의 행이 편집 가능한지 묻는 메서드
  optional func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
  
  // 특정 위치의 행을 재정렬 할 수 있는지 묻는 메서드
  optional func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
   ```

## UIAlertController

## UserDefaults
