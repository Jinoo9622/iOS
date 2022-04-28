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
    - Value Type
      ```swift
      public protocol Publisher {}
      struct AnyPublisher: Publisher {}
      ```
    - 값(Data Type)과 오류(Error Type)를 정의
      ```swift
      associatedtype Output
      associatedtype Failure: Error
      
      AnyPublisher<String, Error>
      AnyPublisher<String, Never> // error가 발생할 수 없는 경우 Never Type 사용
      ```
  - Observable
    - Reference Type
      ```swift
      class Observable: ObservableType {}
      ```
    - element라는 data type을 받을 뿐 별도의 error type을 받지 않는다. (Result Type 사용 시, Publisher와 비슷하게 구현 가능)
      ```swift
      class Observable<Element>
      
      Observable<Result<String, Error>>
      Observable<String>
      ```
- RxSwift에만 있는 Operators
  - amb
  - groupBy
  - asObserver
  - ifEmpty(switchTo:)
  - concatMap
  - interrval
  - create
  - materialize
  - delaySubscription
  - range
  - dematerialize
  - repeatElement
  - enumerated
  - retryWhen
  - faltMapFirst
  - sample
  - from
  - withLatestFrom
- Combine에만 있는 Operators (try + operators / error handling을 도와줌)
  - tryMap
  - tryContaions(where:)
  - tryScan
  - tryAllSatisfy
  - tryFilter
  - tryDrop(while:)
  - tryCompactMap
  - tryPrefix(while:)
  - tryRemoveDuplicates(by:)
  - tryFirst(where:)
  - tryReduce
  - tryLast(where:)
  - tryMax(by:)
  - tryCatch
  - tryMin(by:)
  - ex.
    ```swift
    func map<T>(_ transform: (Output) -> T) -> Just<T>
    
    func tryMap<T>(_ transform: (Output) throws -> T) -> Result<T, Error>.Publisher
    ```
- 결합연산자 (RxSwift / Combine)
  - Combine: 묶을 수 있는 sequence 개수에 따라 다른 struct명을 갖는다
  - merge / Merge, Merge2 ... MergeMany
  - combineLatest / CombineLatest, CombineLatest3, CombineLatest4
  - zip / Zip, Zip3, Zip4
- Subject (Observable이면서 Observer / Publisher면서 Subscriber)
  - PublishSubject / PassthroughSubject
  - ReplaySubject / ❌
  - BehaviorSubject / CurrentValueSubject
  ```swift
  // PassthroughSubject
  class PassthroughSubject<Output, Failiure> {
      public init() {
      }
  }
  // PublishSubject
  class PublishSubject<Element> {
      override init() {
      }
  }
  
  // CurrentValueSubject 
  class CurrentValueSubject<Output, Failure> {
      public init(_ value: Output) {
      }
  }
  // BehaviorSubject
  class BehaviorSubject<Element> {
      init(value: Element) {
      }
  }
  ```

- Disposable / Cancellable
  - memmory 누수 방지
  - deinit 시점에 publisher에 대하여 auto cancel이 일어남
  - Combine의 경우 RxSwift의 DisposeBag과 같은 역할을 하는 것은 없음
  ```swift
  // Cancellable
  let cancellables = Set<Cancellable>()
  Just(1)
      .sink {
          print($0)
      }
      .store(in: &cancellables)
      
  // Disposable
  let disposeBag = DisposeBag()
  Observable.just(1)
      .subscribe(onNext: {
          print($0)
      })
      .disposed(by: disposeBag)
  ```
- Thread Handling
  - RxSwift의 subscribe(on:)은 upstream / downstream에 상관없이 동작하지만, Combine의 subscribeOn(:)은 upstream에 대해서만 동작함
