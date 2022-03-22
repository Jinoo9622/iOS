## RxCocoa
- Cocoa Framework와 Rx를 합친 RxSwift 기반의 라이브러리
- RxSwift와는 별도로 선언해주어야 사용 가능
- Producer : 값을 생성
- Consumber : 생성된 값을 수신하고 처리 (값을 반환할 수 없음)
 
  ![image](https://user-images.githubusercontent.com/46417892/159453578-8792e72f-4097-4348-b9ba-7605a2507c7c.png) 
- **Binder**
  - binding : 단방향 data stream
  - Binder
    - Observer 
    - UI Binding에 사용
    - Error 이벤트를 받지 않음
    - Main Thread에서 실행되는 것을 보장
  ```swift
  textField.rx.text
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: {
          label.text = $0
      })
      .disposed(by: disposeBag)
  // 같은 기능
  textField.rx.text
      .bind(to: label.rx.text)
      .disposed(by: disposeBag)
  ```
- Traits
  - 에러를 방출하지 않는 특별한 observable
  - 모든 과정은 Main Thread에서 이뤄짐
  - 스트림 공유가 가능 (리소스 절약)
    - bind 사용 시, observer가 늘어날 때마다 stream도 늘어남 -> 리소스 낭비
  - Driver : 초기값 || 최신값 replay
  - Single : 구독한 이후에 발생하는 값 전달

- Rx Extension
- ```swift  
  extension Reactive where Base: T {} 
  ```
  
