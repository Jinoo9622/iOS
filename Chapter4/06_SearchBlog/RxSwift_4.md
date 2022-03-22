## Combinig Operator
- [Combining Operator 예제](https://github.com/Jinoo9622/iOS/blob/master/Chapter4/06_SearchBlog/CombiningOperators.playground/Contents.swift)

## Time Based Operator
- [Time Based Operator 예제](https://github.com/Jinoo9622/iOS/blob/master/Chapter4/06_SearchBlog/TimeBasedOperators.playground/Contents.swift)

## Error 처리
- catch
  - 기본값(defaultValue)으로 error 복구하기 
  - ```swift
    func catch(_ handler:) -> RxSwift.Observable<Self.Element>
    ```
    - ```swift
      enum MyError: Error {
          case anError
          case criticalError
      }

      Observable.create {
          $0.onError(MyError.anError)
          return Disposables.create()
      }
      .catch { error in 
          switch error as! MyError {
          case .anError:
              return .just("괜찮아요")
          case .criticalError:
              return .just("안괜찮아요")
          } 
      }
      .subscribe {
          print($0)
      }
      .disposed(by: disposeBag)
      
      // 출력값 
      괜찮아요
      ```
  - ```swift
    func catchAndReturn(_ element: Self.Element) -> RxSwift.Observable<Self.Element>
    ```
    - ```swift
      enum MyError: Error {
          case anError
      }
      
      Observable.create { 
          $0.onError(MyError.anError)
          return Disposables.create()
      }
      .catchAndReturn("NO!! ERROR!!")
      .subscribe {
          print($0)
      }
      .disposed(by: disposeBag)
      
      // 출력값
      next(NO!! ERROR!!)
      completed
      ```
- retry
  - 제한적 or 무제한으로 재시도(retry) 하기 
  - ```swift
    func retry() -> RxSwift.Observable<Self.Element>
    ```
    - ```swift
      enum MyError: Error {
          case anError
          case criticalError
      }
      // 무제한으로 재시도
      Osbervable.create {
          $0.onError(MyError.anError)
          return Disposables.create()
      }
      .retry()
      .subscribe {
          print($0)
      }
      .disposed(by: disposeBag)
      ```
  - ```swift
    func retry(_ maxAttemptCount: Int) -> RxSwift.Observable<Self.Element>
    ```
    - ```swift
      enum MyError: Error {
          case anError
          case criticalError
      }
      // 1000번 재시도
      Observable.create {
          $0.onError(MyError.anError)
          return Disposables.create()
      }
      .retry(1000)
      .subscribe {
          print($0)
      }
      .disposed(by: disposeBag)
      ```
