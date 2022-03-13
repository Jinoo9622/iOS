import RxSwift

let disposeBag = DisposeBag()

print("=====ignoreElements=====")
// ignoreElemets: next event를 무시 (error, completed event는 허용)
let sleep = PublishSubject<String>()

sleep
    .ignoreElements()
    .subscribe {
        print("\($0): ☀️")
    }
    .disposed(by: disposeBag)

sleep.onNext("🔈")
sleep.onNext("🔉")
sleep.onNext("🔊")

sleep.onCompleted()

print("=====element(at:)=====")
// element(at:) : n번째 index에 대해서만 onNext event 방출 (나머지 무시)
let cryTwice = PublishSubject<String>()

cryTwice
    .element(at: 2)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

cryTwice.onNext("🔈")   // index 0
cryTwice.onNext("🔈")   // index 1
cryTwice.onNext("🥰")   // index 2
cryTwice.onNext("🔈")   // index 3
cryTwice.onNext("🔈")   // index 4
cryTwice.onNext("🤚")   // index 5

print("=====filter=====")
// filter : 구문 내의 true인 값들만 방출
Observable.of(1, 2, 3, 4, 5, 6, 7, 8)
    .filter { $0 % 2 == 0 }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====skip=====")
// skip : 첫번째 element부터 n개의 element를 무시
Observable.of("😀", "😃", "😄", "😂", "🤣", "😇", "🤪", "😶‍🌫️")
    .skip(5)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====skip(while:)=====")
// skip(while:) : 조건에 맞는 element를 skip하지 않을때까지 (조건이 false일때부터 방출) skip
Observable.of("😀", "😃", "😄", "😂", "🤣", "😇", "🤪", "😶‍🌫️")
    .skip(while: {
        $0 != "😇"
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====skip(until:)=====")
// skip(until:) : 다른 Observable에 기반한 요소들을 dynamic하게 filter
// - 현재 Observable이 다른 Observable이 onNext event를 방출하기 전까지 모든 event를 무시
let customer = PublishSubject<String>()
let openTime = PublishSubject<String>()

customer    // 현재 Observable
    .skip(until: openTime)  // 다른 Observable
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

customer.onNext("😍")
customer.onNext("😎")

openTime.onNext("Open!!")
customer.onNext("🥸")

print("=====take=====")
// take : 처음부터 n번째의 값까지만을 방출, 이후로는 skip (skip과 반대)
Observable.of("🥇", "🥈", "🥉", "🏅", "🥸")
    .take(3)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====take(while:)=====")
// take(while:) : while 조건이 true인 동안 element 방출 (조건이 false일때까지 방출) (skip(while:)과는 반대)
Observable.of("🥇", "🥈", "🥉", "🏅", "🥸")
    .take(while: {
        $0 != "🥉"
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====enumerated=====")
// enumerated: element와 index를 같이 표현 (방출된 element의 index를 참고하고 싶을 경우 사용)
Observable.of("🥇", "🥈", "🥉", "🏅", "🥸")
    .enumerated()
    .take(while: {
        $0.index < 3
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====take(until:)=====")
// take(until:) : 다른 Observable에 기반한 요소들을 dynamic하게 filter
// - 현재 Observable이 다른 Observable이 onNext event를 방출한 이후, 모든 event 무시 (다른 Observable이 onNext event를 방출하기 전까지 event 방출) (skip(until:)과 반대)
let enrolment = PublishSubject<String>()
let deadline = PublishSubject<String>()

enrolment   // 현재 Observable
    .take(until: deadline)  // 다른 Observable
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

enrolment.onNext("😎")
enrolment.onNext("🥸")
enrolment.onNext("😄")

deadline.onNext("End!!")

enrolment.onNext("🤣")
enrolment.onNext("🤪")

print("=====distinctUntilChanged=====")
// distinctUntilChanged: 연달아 같은 값이 중복되어 방출될때, 중복된 값을 막아줌(무시)
Observable.of("저는", "저는", "앵무새", "앵무새", "앵무새", "앵무새", "입니다", "입니다", "입니다", "저는", "앵무새", "앵무새", "일까요?", "일까요?", "일까요?", "일까요?")
    .distinctUntilChanged()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
