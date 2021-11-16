//
//  ViewController.swift
//  Pomodoro
//
//  Created by 박진우 on 2021/11/16.
//

import UIKit
import AudioToolbox

enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var duration = 60       // 타이머에 설정된 시간을 초로 저장 (datePicker의 default 값이 1분 -> 60초로 설정)
    var timerStatus: TimerStatus = .end
    var timer: DispatchSourceTimer?     // 타이머: 특정 시간이 지난 후 이벤트를 발생시키거나, 반복적인 주기로 특정 작업을 수행하는 등의 행위를 함.
    var currentSeconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comfigureToggleButton()
    }
    
    func setTimerInfoViewVisible(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    func comfigureToggleButton() {  // 버튼의 상태에 따라, 표시되는 title  설정
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정지", for: .selected)
    }

    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)    // UI 변경이 필요하기에, main thread에 timer 생성
            self.timer?.schedule(deadline: .now(), repeating: 1)    // 타이머 생성시, 즉시 실행(deadline: .now()) / repeating: n초에 한번씩
            // schedule로 설정한 주기마다 handler 내부의 closure 실행
            self.timer?.setEventHandler(handler: {  [weak self] in
                guard let self = self else { return }
                self.currentSeconds -= 1
                let hour = self.currentSeconds / 3600
                let minutes = (self.currentSeconds % 3600) / 60
                let seconds = self.currentSeconds  % 60
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
                self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
                
                UIView.animate(withDuration: 0.5, delay: 0) {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
                }
                UIView.animate(withDuration: 0.5, delay: 0.5) {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi * 2)
                }
                if self.currentSeconds <= 0 {
                    // 타이머 종료
                    self.stopTimer()
                    AudioServicesPlaySystemSound(1005)  // https://iphonedev.wiki/index.php/AudioServices - SystemSoundID
                }
            })
            self.timer?.resume()
        }
    }
    
    func stopTimer() {
        if self.timerStatus == .pause {
            // timer가 suspend된 상태(일시정지)에서 nil을 할당 시, runtime error 발생
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.cancelButton.isEnabled = false
        UIView.animate(withDuration: 0.5) {
            self.timerLabel.alpha = 0
            self.progressView.alpha = 0
            self.datePicker.alpha = 1
            self.imageView.transform = .identity    // imageView를 원상태로 복구
        }
//        self.setTimerInfoViewVisible(isHidden: true)
//        self.datePicker.isHidden = false
        self.toggleButton.isSelected = false
        self.timer?.cancel()
        // timer에 nil을 할당하여 메모리에서 해제 (백그라운드에서 동작하는것을 방지)
        self.timer = nil
    }
    
    @IBAction func tapCancelButton(_ sender: Any) {
//        switch self.timerStatus {
//        case .start, .pause:
        self.stopTimer()
//        default:
//            break
//        }
    }
    
    @IBAction func tapToggleButton(_ sender: Any) {
        // countDownDuration: datePicker에서 설정한 카운트다운 시간(초)
        self.duration = Int(self.datePicker.countDownDuration)
        
        switch self.timerStatus {
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start
            UIView.animate(withDuration: 0.5) {
                self.timerLabel.alpha = 1
                self.progressView.alpha = 1
                self.datePicker.alpha = 0
            }
//            self.setTimerInfoViewVisible(isHidden: false)
//            self.datePicker.isHidden = true
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
            self.startTimer()
        case .start:
            self.timerStatus = .pause
            self.toggleButton.isSelected = false
            self.timer?.suspend()
        case .pause:
            self.timerStatus = .start
            self.toggleButton.isSelected = true
            self.timer?.resume()
        }
    }
}

