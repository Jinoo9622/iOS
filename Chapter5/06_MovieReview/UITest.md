## UI Test
- UI Component의 표시와 동작이 의도한 대로 잘 작동되는지 확인하는 Test
- Unit Test / UI Test
  - Unit Test: Scene을 테스트 대상으로 실행
    - ex) class MovieListPresenterTests: XCTest {}
  - UI Test: 하나의 앱을 테스트 대상으로 실행
    - ex) XCUIApplication().launch() 
    - 쉽게 작성하는 법
      1. console 영역의 녹화버튼 클릭
          
          <img width="1792" src="https://user-images.githubusercontent.com/46417892/183398589-138b54a4-2a41-4d00-b392-ec46f2d08ea4.png">
  
      2. 실행된 Simulator에서 클릭 / 제스쳐 등 실행

          <img width="400" src="https://user-images.githubusercontent.com/46417892/183399122-c285b43b-0bc0-438b-aa74-c195a4ffb60b.png">
          
          <img width="400" src="https://user-images.githubusercontent.com/46417892/183399208-bed3e8a5-3938-4590-907e-74cf267d4a3d.png">


      3. 실행한 클릭 / 제스쳐 등이 표시됨

          ![image](https://user-images.githubusercontent.com/46417892/183399265-cbd463c0-2cf5-475e-af81-a053a6b5ea7a.png)
        
          ![image](https://user-images.githubusercontent.com/46417892/183399298-ddc5d6ca-22ad-487e-b054-87c0c8e0798f.png)

