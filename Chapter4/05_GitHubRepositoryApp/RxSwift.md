## RxSwift
1. RxSwift란
  - ReactiveX는 Observable sequence를 이용하여, 비동기 및 이벤트 기반 프로그램을 구성하기위한 오픈소스 라이브러리.
  - RxSwift란 Reactive eXtension Swift의 줄임말로, ReativeX의 Swift 버전. 
  - observer pattern, iterator pattern, functional programming을 조합한 반응형 프로그래
2. RxSwift의 구성요소 3가지
  2.1 Observable
    - Rx 코드의 기반이 되는 class
    - T 형태의 데이터 snapshot을 **전달**할 수 있는 일련의 이벤트를 비동기적으로 생성하는 기능
    - 하나 이상의 observer가 실시간으로 어떤 이벤트에 반응
    - 3가지 유형의 이벤트만을 생성
    
      ```swift
      enum Event<Element> {
        case next(Element)      // next element of a sequence (최신/다음 데이터를 전달하는 이벤트, T에 해당하는 Element 전달)
        case error(Swift.Error) // sequence failed with error (Observable이 에러를 발생시켜, 추가적으로 이벤트를 생성 X)
        case completed          // squence teminated successfully (성공적으로 일련의 이벤트를 종료시키는 이벤트, 추가적으로 이벤트 생성 X)
      }
      ```
      
    - Finite Observable
    
      ```swift
      Network.download(file: "https://www...")
          .subscribe(
          onNext: { data in
              // 임시 파일에 데이터 추가
          },
          onError: { error in
              // 사용자에게 에러 표현
          },
          onCompleted: {
              // 다운로드된 파일 사용
          })
      ```
      
    - Infinite Observable
    
      ```swift
      UIDevice.rx.orientation
          .subscribe(onNext: { current in
              switch current {
              case .landscape:
                  // 가로모드
              case .portrait:
                  // 세로모드
              }
          })
      ```
      
  2.2 Opertator
    - Observable
  2.3 Scheduler
    - 
