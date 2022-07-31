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
  - Homebrew: Mac Local 자체에 설치
