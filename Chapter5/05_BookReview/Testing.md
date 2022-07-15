## XCTest
- Unit Test: 특정 함수, 메소드의 동작에 대한 테스트
- UI Test: UI 표시 or UI Action에 대한 테스트

  <img width="272" src="https://user-images.githubusercontent.com/46417892/179194106-5d2004c8-510c-4783-a0c5-e311c5e738ee.png">

- Test Coverage
  - Xcode Project에서 몇 %의 코드에 대해서 테스트가 작성되어 있는지 나타낸 숫자.
  - App의 안정성을 확인하는 기준

    ```swift
    override func setUpWithError() throws { // 각각의 Test 항목이 실행될 때마다, 실행되는 method

    }

    override func tearDownWithError() throws {  // 각각의 Test 항목이 종료될 때마다, 실행되는 method

    }

    func testExample() throws { // 1개의 Test 항목 (※ 어두에 test가 있는 경우, test method로 인식)

    }
    ```
