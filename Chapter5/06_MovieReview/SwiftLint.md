## SwiftLint
- SwiftLint는 스위프트 스타일 및 컨벤션을 강제하기 위한 패키지
- 커스텀의 경우, **.swiftlint.yml** file을 추가 (자동으로 생성되지 않아서, 수동으로 추가해야함)
- [참고](https://github.com/realm/SwiftLint)
- 설치방법
  - Cocoapods: Xcode Project 마다 설치
    - 1. Cocoapods으로 SwiftLint 설치
      
        ```
        pod 'SwiftLint'
        ```
        
    - 2. Xcode Project Build Phase 추가
      
        ```
        ${PODS_ROOT}/SwiftLint/swiftlint
        ```
        
        <img width="1792" src="https://user-images.githubusercontent.com/46417892/182019251-bc7f77a3-13b0-49b8-a170-ee05c0cf9827.png">

        <img width="1792" src="https://user-images.githubusercontent.com/46417892/182019259-05b2c81f-f0b2-47c8-9158-0fae2e4e0dcf.png">

        
      
  - Homebrew: Mac Local 자체에 설치
