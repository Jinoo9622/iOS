## RxSwift
- RxSwift란
  - ReactiveX는 Observable sequence를 이용하여, 비동기 및 이벤트 기반 프로그램을 구성하기위한 오픈소스 라이브러리.
  - RxSwift란 Reactive eXtension Swift의 줄임말로, ReativeX의 Swift 버전. 
  - observer pattern, iterator pattern, functional programming을 조합한 반응형 프로그래
- RxSwift의 구성요소 3가지
  1. Observable
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
      
  2. Opertator
     - ObservableType과 Observable 클래스에 포함된 복잡한 논리를 구현하기 위한 다양한 Method
     - Opertator는 비동기 입력을 받아 출력만 생성하기 때문에 Operator들끼리 쉽게 혼합하여 사용이 가능
     - Observable에 의해 들어온 값들을 처리하고 최종값이 나올때 방출
     - 예시.

        ```swift
        // 가로방향(landscape)이 아닌 세로방향(protrait)이 배출되었을때만 결과값을 return
        UIDevice.rx.orientation
            .filter { value in
                return value != .landscape
            }
            .map { _ in
                return "세로모드만 적용가능"
            }
            .subscribe(onNext: { string in
                showAlert(text: string)
            })
        ```
      
  3. Scheduler
     - Scheduler는 함수를 실행하는 Thread를 결정해주는 역할을 함 (Rx에서의 DispatchQueue)
     - UI를 변화시키는 함수는 Main Thread에서 실행이되며, API를 통해 데이터를 가져오거나 연산 등을 하는 함수는 Background에서 실행
     - RxSwift에는 여러가지 Scheduler가 정의되어 있으며, 대부분의 상황에 적용이 가능하기에 개발자가 직접 Scheduler를 생성하는 경우는 거의 없음
