## XCTest
- Unit Test: 특정 함수, 메소드의 동작에 대한 테스트
- UI Test: UI 표시 or UI Action에 대한 테스트

  <img width="272" src="https://user-images.githubusercontent.com/46417892/179194106-5d2004c8-510c-4783-a0c5-e311c5e738ee.png">

    ```swift
    override func setUpWithError() throws { // 각각의 Test 항목이 실행될 때마다, 실행되는 method

    }

    override func tearDownWithError() throws {  // 각각의 Test 항목이 종료될 때마다, 실행되는 method

    }

    func testExample() throws { // 1개의 Test 항목 (※ 어두에 test가 있는 경우, test method로 인식)

    }
    ```

## Test Coverage
- Xcode Project에서 몇 %의 코드에 대해서 테스트가 작성되어 있는지 나타낸 숫자.
- App의 안정성을 확인하는 기준
- 설정방법
  1. Edit Scheme 선택

      <img width="555" src="https://user-images.githubusercontent.com/46417892/179216476-35e6641c-b773-4b00-9799-60bf774c5e63.png">
    
  2. Test > Options > Code Coverage > Gather coverage for 체크

      <img width="932" src="https://user-images.githubusercontent.com/46417892/179216902-4f56ad95-8c48-4baf-8e19-17738897d796.png">
    

  3. 작성한 모든 Test 실행

      <img width="300" src="https://user-images.githubusercontent.com/46417892/179217291-feced3c8-9ac3-4a12-9481-981e75a9d99e.png">
    
  4. Coverage 확인
    
      <img width="958" src="https://user-images.githubusercontent.com/46417892/179217387-5af1a566-f4bd-4056-9346-fcdd7dd8acfb.png">
     
