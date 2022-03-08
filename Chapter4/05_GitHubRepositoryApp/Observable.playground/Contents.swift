import Foundation
import RxSwift

// Observable은 단순 정의이기에, subscribe 시에만 동작
print("----Just----")
// just: 1개의 element만 방출하는 observable 생성 operator
Observable<Int>.just(1)
    .subscribe(onNext: {
        print($0)
    })
print("----Of1----")
// of: 1개 이상의 element를 방출하는 observable 생성 operator
Observable<Int>.of(1, 2, 3, 4, 5)
    .subscribe(onNext: {
        print($0)
    })

print("----Of2----")
// 1개의 array를 방출하는 obervable == jsut
Observable.of([1, 2, 3, 4, 5])
    .subscribe(onNext: {
        print($0)
    })

print("----From----")
// from: array 형태의 element를 받아, 해당 array 안의 값들을 하나씩 방출
Observable.from([1, 2, 3, 4, 5])
    .subscribe(onNext: {
        print($0)
    })

print("-----subscribe1-----")
// 어떤 이벤트에 어떤 값이 쌓여서 오는지 확인
Observable.of(1, 2, 3)
    .subscribe {
        print($0)
    }

print("-----subscribe2-----")
Observable.of(1, 2, 3)
    .subscribe {
        if let element = $0.element {
            print(element)
        }
    }

print("-----subscribe3-----")
// onNext(success)만, print
Observable.of(1, 2, 3)
    .subscribe(onNext: {
        print($0)
    })

print("-----empty-----")
// empty: element를 1개도 갖지않는 (count = 0)인 Observable 생성
// 1. 즉시 종료할 수 있는 observable return
// 2. 0개의 element를 return
Observable.empty()
    .subscribe {
        print($0)
    }

print("-----empty2-----")
// empty의 경우 type 추론이 불가능하기에 명시적으로 Void 선언
Observable<Void>.empty()
    .subscribe {
        print($0)
    }

Observable.empty()
    .subscribe(onNext: {
    },
    onCompleted: {
        print("Completed")
    })

print("-----never-----")
// never: Subscribe는 하지만, 아무것도 방출하지 않음
Observable<Void>.never()
    .debug("never")
    .subscribe(
        onNext: {
            print($0)
        },
        onCompleted: {
            print("Completed")
        }
    )

print("-----range-----")
// range: 범위에 있는 array를 start부터 count만큼의 값을 갖는 요소를 방출
Observable.range(start: 1, count: 9)
    .subscribe(onNext: {
        print("2 * \($0) = \(2*$0)")
    })

print("-----dispose-----")
// Observable의 subscribe를 종료 (dispose 후에는, 이벤트가 방출되지 않음)
Observable.of(1, 2, 3)
    .subscribe {
        print($0)
    }
    .dispose()

print("-----disposeBag-----")
// disposeBag이 할당 해제될때마다, dispose
let disposeBag = DisposeBag()

Observable.of(1, 2, 3)
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

print("-----create1-----")
// escaping closure
Observable.create { observer -> Disposable in
    observer.onNext(1)  // = observer.on(.next(1))
    observer.onCompleted()  // = observer.on(.completed)
    observer.onNext(2)  // = observer.on(.next(2))
    return Disposables.create()
}
.subscribe {
    print($0)
}
.disposed(by: disposeBag)   // -> onCompleted가 발생하여 종료됨 -> 2는 방출되지않

print("-----create2-----")
enum MyError: Error {
    case anError
}

Observable.create { observer -> Disposable in
    observer.onNext(1)
    observer.onError(MyError.anError)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}
.subscribe(
    onNext: {
        print($0)
    },
    onError: {
        print($0.localizedDescription)
    },
    onCompleted: {
        print("completed")
    },
    onDisposed: {
        print("disposed")
    }
)
.disposed(by: disposeBag)

print("-----deffered1-----")
// observableFactory: Observable을 감싸는 Observable
// deffered: observableFactory를 통해서 Observable Sequence 생성 가능
Observable.deferred {
    Observable.of(1, 2, 3)
}
.subscribe {
    print($0)
}
.disposed(by: disposeBag)

print("-----deffered2-----")
var 뒤집기: Bool = false

let factory: Observable<String> = Observable.deferred {
    뒤집기 = !뒤집기
    
    if 뒤집기 {
        return Observable.of("👍")
    } else {
        return Observable.of("👎")
    }
}

for _ in 0...3 {
    factory.subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
}
