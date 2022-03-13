import RxSwift

let disposeBag = DisposeBag()

print("=====toArray=====")
// toArray : Observable의 독립적 element를 array로 변환
// Trait의 single로 변함
Observable.of("A", "B", "C")
    .toArray()
    .subscribe(onSuccess: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====map=====")
// map : swift의 map과 동일
Observable.of(Date())
    .map { date -> String in
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====flatMap=====")
// flatMap: map과 동일하나, return type이 Observable type
protocol Player {
    var score: BehaviorSubject<Int> { get }
}

struct Archer: Player {
    var score: BehaviorSubject<Int>
}

let koreaAthlete = Archer(score: BehaviorSubject<Int>(value: 10))
let usaAthlete = Archer(score: BehaviorSubject<Int>(value: 8))

let olympic = PublishSubject<Player>()

olympic
    .flatMap { player in    // player의 score값 만을 event로 방출
        player.score
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

olympic.onNext(koreaAthlete)    // olympic의 onNext 뿐만 아니라
koreaAthlete.score.onNext(10)   // olympic에 등록된 koreaAthlete의 onNext 시에도, event 방출

olympic.onNext(usaAthlete)
koreaAthlete.score.onNext(10)
usaAthlete.score.onNext(9)

print("=====flatMapLatest=====")
// flatMapLatest : map + switchLatest
// - 가장 최근의 Observable에서 값을 생성하며, 그 이전에 발생한 Observable을 구독 해제함
// - 네트워킹에서 자주 사용됨.
struct HighJumper: Player {
    var score: BehaviorSubject<Int>
}

let seoul = HighJumper(score: BehaviorSubject<Int>(value: 7))
let jeju = HighJumper(score: BehaviorSubject<Int>(value: 6))

let championship = PublishSubject<Player>()

championship
    .flatMapLatest { player in
        player.score
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

championship.onNext(seoul)
seoul.score.onNext(9)

championship.onNext(jeju)   // jeju가 등록되었기 때문에, seoul은 해제됨
seoul.score.onNext(10)
jeju.score.onNext(8)

print("=====materialize & dematerialize=====")
// materialize : event + element, event와 element를 함께 받을 수 있음 (event로 element를 감싸서 표현)
// dematerialize : materialize 해제 (event로 감싸져있는 element를 꺼냄(element만))
enum Foul: Error {
    case foul
}

struct Runner: Player {
    var score: BehaviorSubject<Int>
}

let kimRunner = Runner(score: BehaviorSubject<Int>(value: 0))
let parkRunner = Runner(score: BehaviorSubject<Int>(value: 1))

let hundredMeterRun = BehaviorSubject<Player>(value: kimRunner)

hundredMeterRun
    .flatMapLatest { player in
        player.score
            .materialize()
    }
    .filter {
        guard let error = $0.error else {
            return true
        }
        print(error)
        return false
    }
    .dematerialize()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

kimRunner.score.onNext(1)
kimRunner.score.onError(Foul.foul)
kimRunner.score.onNext(2)

hundredMeterRun.onNext(parkRunner)
parkRunner.score.onNext(3)

print("----- Example : 11 Digit PhoneNumber -----")
let inputNum = PublishSubject<Int?>()

let list: [Int] = [1]

inputNum
    .flatMap {
        $0 == nil
            ? Observable.empty()
            : Observable.just($0)
    }
    .map {  // optional 해제
        $0!
    }
    .skip(while: {  // PhoneNumber는 0으로 시작
        $0 != 0
    })
    .take(11)   // 11자리를 받음
    .toArray()  // 11개의 element를 single array로 변환
    .asObservable() // 다시 Observable로 변환
    .map {  // string type으로 변환
        $0.map { "\($0)"}
    }
    .map { numbers in
        var numberList = numbers    // 01012345678
        numberList.insert("-", at: 3)   // 010-12345678
        numberList.insert("-", at: 8)   // 010-1234-5678
        let number = numberList.reduce(" ", +)  // 각각의 string을 붙임 (초기값 = " ")
        /* ==
        let number = numberList.reduce(" ", {
            $0 + $1
        })
         */
        return number
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

inputNum.onNext(10)
inputNum.onNext(0)
inputNum.onNext(nil)
inputNum.onNext(1)
inputNum.onNext(0)
inputNum.onNext(1)
inputNum.onNext(2)
inputNum.onNext(nil)
inputNum.onNext(3)
inputNum.onNext(4)
inputNum.onNext(5)
inputNum.onNext(6)
inputNum.onNext(7)
inputNum.onNext(8)
inputNum.onNext(9)
