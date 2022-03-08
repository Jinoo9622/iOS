## Operators
- [Operators_예제](https://github.com/Jinoo9622/iOS/blob/master/Chapter4/05_GitHubRepositoryApp/Observable.playground/Contents.swift)

## Traits
- [Traits_예제](https://github.com/Jinoo9622/iOS/blob/master/Chapter4/05_GitHubRepositoryApp/Traits.playground/Contents.swift) 
- Observable의 제한된 버전
- Single
  - success 이벤트(next + completed) or error 이벤트를 **1번만** 방출하는 observable 
  - http 통신 같은 비동기적 연산에 사용 가능
    
    ![image](https://user-images.githubusercontent.com/46417892/157216183-b67e72b5-1b92-4f5b-9d76-18e7d44d0781.png)

- Maybe
  - single과 비슷하나, 아무런 값을 갖지 않는 completed 방출 가능

    ![image](https://user-images.githubusercontent.com/46417892/157216303-ced72cf7-e3c9-4d4c-9e99-5cfebcc81747.png)

- Completable
  - completed 이벤트 or error 이벤트만을 방출하는 observerable
  - 어떠한 값도 방출하지 않음
  - 동기식 연산의 성공 여부 등을 확인할때 사용 가능

    ![image](https://user-images.githubusercontent.com/46417892/157216391-3f6f8470-cf1c-404e-aa3f-c70c8f9f0849.png)
