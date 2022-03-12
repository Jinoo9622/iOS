import RxSwift

let disposeBag = DisposeBag()

print("=====PublishSubject=====")
let publishSubject = PublishSubject<String>()

publishSubject.onNext("1. 여러분 안녕하세요?")

let subscriber1 = publishSubject
    .subscribe(onNext: {
        print("subscriber1: \($0)")
    })

publishSubject.onNext("2. 들리나요")
publishSubject.on(.next("3. 안들리나요"))

subscriber1.dispose()

let subscriber2 = publishSubject
    .subscribe(onNext: {
        print("subscriber2: \($0)")
    })

publishSubject.onNext("4. 여보세요")
publishSubject.onCompleted()

publishSubject.onNext("5. END")

subscriber2.dispose()

publishSubject
    .subscribe {
        print("subscriber3:", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

// Complete된 이후에, subscribe한뒤, onNext를 받아도, next event는 받을 수 없다.
publishSubject.onNext("6. Print?")

print("=====BehaviorSubject=====")
enum SubjectError: Error {
    case error1
}

// BehaviorSubject의 경우, 반드시 초기값을 받음
let behaviorSubject = BehaviorSubject<String>(value: "0. 초기값")

behaviorSubject.onNext("1. 첫번째 값")

// BehaviorSubject는 subscribe 직전의 event를 받을 수 있음
behaviorSubject.subscribe {
    print("subscribe 1:", $0.element ?? $0)
}
.disposed(by: disposeBag)

//behaviorSubject.onError(SubjectError.error1)

behaviorSubject.subscribe {
    print("subscribe 2:", $0.element ?? $0)
}
.disposed(by: disposeBag)

// BehaviorSubject는 가장 최신의 onNext 값을 뽑을 수 있음
let value = try? behaviorSubject.value()
print(value)

print("=====ReplaySubject=====")
// bufferSize n: n개의 직전 이벤트를 저장 -> 구독 이전의 n개의 onNext event element를 가져올 수 있
let replaySubject = ReplaySubject<String>.create(bufferSize: 2)

replaySubject.onNext("1. 여러분")
replaySubject.onNext("2. 화이팅")

replaySubject.subscribe {
    print("subscribe1:", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.onNext("3. 힘내세요")

replaySubject.subscribe {
    print("subscribe2:", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.onNext("4. 할 수 있어요")
replaySubject.onError(SubjectError.error1)
replaySubject.dispose()

replaySubject.subscribe {
    print("subscribe3:", $0.element ?? $0)
}
.disposed(by: disposeBag)
