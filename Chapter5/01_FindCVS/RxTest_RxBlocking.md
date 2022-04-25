## RxTest
- Unit Test (단위테스트)
  - 원하는 값이 나오는지 검증
  - 연속되어야 하는 동작이 수행되는지 검증
- Observable의 테스트
  
  ```swift
  let observable = Observable.of(1,2,3)
  // 1,2,3이 나오는지 검증
  ```
- RxTest 
  - Observable에 시간 개념을 주입 (언제, 무엇이 나왔는지 검증 가능)
  - 임의의 Observer를 통해 subscribe 여부 관계 없이 검증 가능 (가상의 시간이 흐른 뒤에 타이밍과 이벤트를 반환)
  
    ```swift
    // 가상의 시간 흐름 생성
    let scheduler = TestScheduler(initialClock: 0)
    
    // 원하는 시점에 Event가 발생하는 Observable 생성 (구독의 여부와 관계없이 이벤트 발생)
    let observable = scheduler.createHotObservable([
            .next(1, "A"),
            .next(2, "B"),
            .next(3, "C")
        ])   
    // OR
    // 원하는 시점에 Event가 발생하는 Observable 생성 (구독이 시작되어야 정해진 순서대로 이벤트 발생)
    let observable = scheduler.createColdObservable([
            .next(1, "A"),
            .next(2, "B"),
            .next(3, "C")
        ])
        
    // String을 관찰하는 Observer 생성
    let observer = scheduler.createObserver(String.self)
    
    observable
        .subscribe(observer)
        .disposeBag(by: disposeBag)
        
    // 가상의 시간이 모두 흐르도록
    scheduler.start()
    // -> ex. 결과값 [("A", 1초), ("B", 2초), ("C", 3초)]
    
    // Nimble의 문법을 활용한 Test Assertion
    expect(observer.events).to(
        equal([
            .next(1, "A"),
            .next(2, "B"),
            .next(3, "C")
        ])
    )
    ```
  
## RxBlocking
- Observable의 Event 방출을 검증
- 특정 시간동안 방출된 Observable의 Event 검증
- RxTest에 있는 scheduler라는 개념은 없음
  
  ```swift
  // Observable -> BlockingObservable
  let observable = Observable.of("A","B","C").toBlocking
  
  // Observable의 .next 이벤트를 Array로 전환
  // .toArray(): 해당 observable이 onCompleted 까지 대기
  let values = try! observable.toArray()
  
  // Nimble의 문법을 활용한 Test Assertion
  expect(values).to(equal(["A","B","C"]))
  ```
   
