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

- Test Coverage 확인
  - 적용
    - Edit Scheme (Product -> Scheme -> Edit Scheme)

      <img width="179" src="https://user-images.githubusercontent.com/46417892/185604695-4a21b538-8c5a-40a6-bc7c-28fc0957126a.png">
      
      <img width="583" src="https://user-images.githubusercontent.com/46417892/185604782-ae386daa-58bd-4d44-b1c1-5b4d29ea66a2.png">
      
    - Test -> Code Coverage check

      <img width="935" src="https://user-images.githubusercontent.com/46417892/185604945-0b38ee03-2048-465f-882d-9a287dd6ff7e.png">
      
  - 확인
 
    <img width="952" src="https://user-images.githubusercontent.com/46417892/185605238-1afecdc5-bb81-48f2-a01a-77590d43f292.png">

    
