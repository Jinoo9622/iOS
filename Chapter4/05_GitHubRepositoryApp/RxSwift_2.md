## Operators
- [참고자료](https://github.com/Jinoo9622/iOS/blob/master/Chapter4/05_GitHubRepositoryApp/Observable.playground/Contents.swift)

## Traits
- Single
  - success 이벤트 or error 이벤트를 **1번만** 방출하는 observable 
  - next + completed
  - 파일 저장 or 파일 다운로드 or 디스크 데이터로딩과 같은 값을 산출하는 비동기적 연산에 사용
  - Observable.single을 이용하여 생성 or 아무 Observaer에 .asSingle() 추가하여 생성
    
    ![image](https://user-images.githubusercontent.com/46417892/157216183-b67e72b5-1b92-4f5b-9d76-18e7d44d0781.png)

- Maybe
  - single과 비슷하나, 

    ![image](https://user-images.githubusercontent.com/46417892/157216303-ced72cf7-e3c9-4d4c-9e99-5cfebcc81747.png)

- Completable

    ![image](https://user-images.githubusercontent.com/46417892/157216391-3f6f8470-cf1c-404e-aa3f-c70c8f9f0849.png)
