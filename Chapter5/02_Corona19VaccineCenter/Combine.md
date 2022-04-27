## Combine
- [참고](https://developer.apple.com/documentation/combine)
- 비동기적인 인터페이스 (cocoa SDK 내에서 closure or complition block을 받는 API)
  - IBTarget / IBAction
  - Notification Center
  - URLSession
  - KVO
  - Ad-hoc callbacks
- 핵심요소 (vs RxSwift)
  - Publishers (Observables)
  - Subscribers (Observers)
  - Operators (Operators)
  - Subject (Subject)
  - Cancellable (Disposable)
  - Subscribe(on:) (SubscribeOn(:))


## Combine vs RxSwift
- Publisher vs Observable
  - Publisher
    - Combine의 선언체
      ```swift
      public protocol Publisher {}
      struct AnyPublisher: Publisher {}
      ```
  - Observable
    - event stream 
      ```swift
      class Observable: ObservableType {}
      ```
