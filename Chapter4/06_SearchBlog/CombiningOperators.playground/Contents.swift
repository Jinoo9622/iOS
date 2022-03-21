import RxSwift

let disposeBag = DisposeBag()

print("=====startWith=====")
// startWith: 기존의 Observable에 초기값을 추가할 수 있음 (동일한 type이 들어가야함)
// 기존 Observable element가 방출되기 전에, 항상 startWith값이 방출됨
// 여러개 사용 시, 가장 마지막에 추가된 순서대로 방출
let yellowClass = Observable.of("kid1", "kid2", "kid3")

yellowClass
    .enumerated()
    .map{ index, element in
        return element + ": \(index)"
    }
    .startWith("teacher")
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
 

print("=====concat1=====")
// concat: 2개 이상의 Observable을 이어서 1개의 Observable로 변환해준다. (선언순서가 중요함)
//  -> 첫번째 Observable의 complete가 방출되면 그 이후의 Observable이 event를 방출 (순차적)
let yellowClassChildren = Observable.of("kid1", "kid2", "kid3")
let teacher = Observable.of("teacher")

let lineWalk = Observable
    .concat([teacher, yellowClassChildren])

lineWalk
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====concat2=====")
// 기준이 되는 observable element를 방출하고, 그 다음 observable을 방출
teacher
    .concat(yellowClassChildren)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("=====concatMap=====")
// 각각의 sequence가 다음 sequence가 구독되기전에 합쳐짐
let dayCareCenter: [String: Observable<String>] = [
    "yellowClass": Observable.of("yellowKid1", "yellowKid2" ,"yellowKid3"),
    "blueClass": Observable.of("blueKid1", "blueKid2" ,"blueKid3")
]

Observable.of("yellowClass", "blueClass")
    .concatMap { dayCareClass in
        dayCareCenter[dayCareClass] ?? .empty()
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====merge1=====")
// merger: 2개 이상의 observable을 순서보장없이 합침.. (오는순서대로 방출)
//    -> 2개의 observable을 합쳐셔 subscribe
// - 두 observable 모두 complete 시, complete 방출 (하나라도 error 방출시, error 방출)
let 강북 = Observable.from(["강북구", "성북구", "동대문구", "종로구"])
let 강남 = Observable.from(["강남구", "강동구", "영등포구", "양천구"])

Observable.of(강북, 강남)
    .merge()
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====merge2=====")
// merge(maxConcurrent:) : 한번에 받아낼 observable의 수
//  -> 어떤 n개의 observable을 받고 있을 때, 다른 observable들의 event를 받지 않음 (받고있는 갯수만큼만 ㅇㅇ)
Observable.of(강북, 강남)
    .merge(maxConcurrent: 1)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

let korean = Observable.from(["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ"])
let english = Observable.from(["A", "B", "C", "D"])
let num = Observable.from(["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"])
let speacialSymbol = Observable.from(["!", "@"])

Observable.of(speacialSymbol, korean, english, num)
    .merge(maxConcurrent: 2)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====combineLatest1=====")
// combineLatest: combineLatest로 결합된 sequence들은 각각의 observable이 방출할 때 마다 closure 호출
//   -> 각각의 observable에 대하여 최신의 값을 조합하여 방출
let lastName = PublishSubject<String>()
let firstName = PublishSubject<String>()

let fullName = Observable
    .combineLatest(firstName, lastName) { firstName, lastName in
        lastName + firstName
    }
    
fullName
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

lastName.onNext("Kim")
firstName.onNext(" name1")
firstName.onNext(" name2")
firstName.onNext(" name3")
lastName.onNext("Park")
lastName.onNext("Lee")
lastName.onNext("Choi")

print("=====combineLatest2=====")
let dateFormatter = Observable<DateFormatter.Style>.of(.short, .long)
let curDate = Observable<Date>.of(Date())

let curDateFormatter = Observable
    .combineLatest(
        dateFormatter,
        curDate,
        resultSelector: { formatter, date -> String in
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = formatter
            return dateFormatter.string(from: date)
        })

curDateFormatter
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====combineLatest3=====")
let lastName2 = PublishSubject<String>()
let firstName2 = PublishSubject<String>()

let fullName2 = Observable  // collection을 받아서 combine
    .combineLatest([firstName2, lastName2]) { name in
        name.joined(separator: " ")
    }

fullName2
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

lastName2.onNext("Kim")
firstName2.onNext("Paul")
firstName2.onNext("Stella")
firstName2.onNext("Lily")

print("======zip======")
// zip : 일련의 observable 중 1개라도 complete되면 해당 observable complete
//  -> 각각의 observable들이 모두 발생하여야 element 방출 (1:1:... 로 각각을 match)
enum winOrLose {
    case win
    case lose
}

let match  = Observable<winOrLose>.of(.win, .win, .lose, .win, .lose)
let player = Observable<String>.of("🇰🇷", "🇨🇭", "🇺🇸", "🇧🇷", "🇯🇵", "🇨🇳")
//let match  = PublishSubject<winOrLose>()
//let player = PublishSubject<String>()

let matchResult = Observable
    .zip(match, player) { result, nation in
        return nation + "player" + " \(result)"
    }

matchResult
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

//match.onNext(winOrLose.win)
//match.onNext(winOrLose.win)
//player.onNext("🇰🇷")
//player.onNext("🇨🇭")
//player.onNext("🇺🇸")
//player.onNext("🇧🇷")
//match.onNext(winOrLose.lose)

print("======withLatestFrom1======")
// withLatestFrom : withLatestFrom 안에 들어가는 observable의 가장 최근의 값을 주체가 되는 observable의 event(next)가 발생했을 경우 방출 (event 이전의 값들은 무시)
let bangTrigger = PublishSubject<Void>()
let runner = PublishSubject<String>()

bangTrigger
    .withLatestFrom(runner)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

runner.onNext("A")
runner.onNext("A B")
bangTrigger.onNext(Void())
bangTrigger.onNext(Void())
runner.onNext("A B C")
bangTrigger.onNext(Void())

print("=====sample=====")
// sample: withLatestFrom + distinctUntilChanged
let startTrigger = PublishSubject<Void>()
let f1Player = PublishSubject<String>()

f1Player
    .sample(startTrigger)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


f1Player.onNext("🏎")
f1Player.onNext("🏎    🚗")
startTrigger.onNext(Void())
f1Player.onNext("🏎    🚗  🚙")
startTrigger.onNext(Void())
startTrigger.onNext(Void())

print("========amb========")
// amb : 2가지 observable중, 먼저 event를 방출한 observable만을 subscribe start. (나머지 것(남은것)은 무시)
//  -> event 발생을 지켜보고 어느 것을 subscribe할지 결정 (순서는 중요하지 않음)
let bus1 = PublishSubject<String>()
let bus2 = PublishSubject<String>()

let busStation = bus1.amb(bus2)

busStation
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

bus2.onNext("bus2 - passenger0")
bus1.onNext("bus1 - passenger0")
bus1.onNext("bus1 - passenger1")
bus2.onNext("bus2 - passenger1")
bus1.onNext("bus1 - passenger2")
bus2.onNext("bus2 - passenger2")

print("=====switchLatest=====")
// switchLatest: source observable의 마지막 sequence의 item만 subscribe함
let student1 = PublishSubject<String>()
let student2 = PublishSubject<String>()
let student3 = PublishSubject<String>()

let handsUp = PublishSubject<Observable<String>>()

let handsUpClass = handsUp.switchLatest()

handsUpClass
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

handsUp.onNext(student1)    // student1만 subscribe | 나머지 무시
student1.onNext("student1: Hello")
student2.onNext("student2: Good Day~!~!")

handsUp.onNext(student2)    // student2만 subscribe | 나머지 무시
student2.onNext("student2: I'm student2!!")
student1.onNext("student1: I have say something....!!!")


handsUp.onNext(student3)    // student3만 subscribe | 나머지 무시
student2.onNext("student2: Go away~!~!")
student1.onNext("student1: Can I...?")
student3.onNext("student3: HI HI")

handsUp.onNext(student1)    // student1만 subscribe | 나머지 무시
student1.onNext("student1: May I...?")
student2.onNext("student2: 😭 😂")
student3.onNext("student3: WOW....")
student1.onNext("student1: HAHAHAHAHAHA")

print("=====reduce=====")
// reduce : 초기값에서 시작하여, source observable의 값이 방출될 때 마다, 해당 값을 가공하고 observable이 완료되었을 때, reduce의 결과값 방출
Observable.from((1...10))
//    .reduce(0, accumulator: { summary, newValue in
//        return summary + newValue
//    })
//    .reduce(0) { summary, newValue in
//        return summary + newValue
//    }
//    .reduce(0) {
//        $0 + $1
//    }
    .reduce(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("=====scan=====")
// scan : reduce의 경우에는 최종 결과값만을 방출하나, scan의 경우에는 매번 값들이 들어올때마다 변형된 값들을 방출
Observable.from((1...10))
    .scan(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
