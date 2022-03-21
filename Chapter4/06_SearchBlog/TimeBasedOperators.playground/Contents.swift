import RxSwift
import RxCocoa
import UIKit
import PlaygroundSupport

let disposeBag = DisposeBag()

print("==========replay==========")
// replay : buffer size만큼의 최신의 event를 가지고 있음
let 인사말 = PublishSubject<String>()
let 반복하는앵무새 = 인사말.replay(1)
// replay 관련 연산자 사용 시, 반드시 connect 필요!!
반복하는앵무새.connect()

인사말.onNext("1. hello")
인사말.onNext("2. hi")

반복하는앵무새
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

인사말.onNext("3. 안녕하세요")

print("==========replayAll==========")
// replayAll : subscribe 시점 이전의 모든 event 방출에 대해서도, 모든 value 확인 가능
let doctorStrange = PublishSubject<String>()
let timeStone = doctorStrange.replayAll()
timeStone.connect()

doctorStrange.onNext("도르마무")
doctorStrange.onNext("거래를")
doctorStrange.onNext("하러왔다")

timeStone
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
/*
print("==========buffer==========")
// buffer : observable에서 방출하는 event를 한번에 묶어서 방출
let source = PublishSubject<String>()

var count = 0
let timer = DispatchSource.makeTimerSource()

timer.schedule(deadline: .now() + 2, repeating: .seconds(1))
timer.setEventHandler {
    count += 1
    source.onNext("\(count)")
}
timer.resume()

source
    .buffer(
        timeSpan: .seconds(2),  // event를 방출하는 (element를 수집하는) 시간 간격, time interval 내에 event를 수집하지 못한다면 빈 array 혹은 그 시점까지 수집한 element들을 방출
        count: 2,   // count에 해당하는 만큼의 element만을 갖 (최대값)
        scheduler: MainScheduler.instance
    )
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("==========window==========")
// buffer와 동일하게 동작하나, return value가 observable type
let 만들어낼최대Observable수 = 3
let 만들시간 = RxTimeInterval.seconds(2)

let window = PublishSubject<String>()

var windowCount = 0
let windowTimerSource = DispatchSource.makeTimerSource()
windowTimerSource.schedule(deadline: .now() + 2, repeating: .milliseconds(400))
windowTimerSource.setEventHandler {
    windowCount += 1
    window.onNext("\(windowCount)")
}
windowTimerSource.resume()

window
    .window(
        timeSpan: 만들시간,
        count: 만들어낼최대Observable수,
        scheduler: MainScheduler.instance
    )
    .flatMap { windowObservable -> Observable<(index: Int, element: String)> in
        return windowObservable.enumerated()
    }
    .subscribe(onNext: {
        print("\($0.index)번째 Observable의 요소 \($0.element)")
    })
    .disposed(by: disposeBag)

print("==========delaySubscription==========")
// delaySubscription : source가 방출하는 event를 특정 시점 이후부터 subscribe
let delaySource = PublishSubject<String>()

var delayCount = 0
let delayTimeSource = DispatchSource.makeTimerSource()
delayTimeSource.schedule(deadline: .now() + 2, repeating: .seconds(1))
delayTimeSource.setEventHandler {
    delayCount += 1
    delaySource.onNext("\(delayCount)")
}
delayTimeSource.resume()

delaySource
    .delaySubscription(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
 
print("==========delay==========")
// delay : 전체 sequence(source observable)의 event 방출을 미룸 (subscribe는 즉시)
let delaySubject = PublishSubject<Int>()

var delayCount = 0
let delayTimeSource = DispatchSource.makeTimerSource()
delayTimeSource.schedule(deadline: .now(), repeating: .seconds(1))
delayTimeSource.setEventHandler {
    delayCount += 1
    delaySubject.onNext(delayCount)
}
delayTimeSource.resume()

delaySubject
    .delay(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("==========interval==========")
Observable<Int>     // 3초 간격으로 event 발생 (Int형 -> 0부터 1씩 증가)
    .interval(.seconds(3), scheduler: MainScheduler.instance)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
 
print("==========timer==========")
// timer : interval과 유사하나
//     1. dueTime 설정가능
//     2. period를 설정하지 않는 경우, event를 1번만 방출
//  -> 직관적으로 timer 생성 가능
Observable<Int>
    .timer(
        .seconds(5),    // dueTime: subscribe 시점과 첫번째 event 발생 사이의 시간
        period: .seconds(2),    // period: event 발생 간격
        scheduler: MainScheduler.instance
    )
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)
 */
print("==========timeout==========")
// timeout : 정해진 timeInterval내에 어떠한 event도 방출하지 않는 경우, error 방출
let 누르지않으면에러 = UIButton(type: .system)
누르지않으면에러.setTitle("눌러주세요1", for: .normal)
누르지않으면에러.sizeToFit()

PlaygroundPage.current.liveView = 누르지않으면에러

누르지않으면에러.rx.tap
    .do(onNext: {
        print("tap")
    })
    .timeout(.seconds(5), scheduler: MainScheduler.instance)
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)
