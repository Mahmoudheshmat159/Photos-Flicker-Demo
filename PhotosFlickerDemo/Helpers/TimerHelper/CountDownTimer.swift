//
//  CountDownTimer.swift
//  FlickerDemo
//
//  Created by apple on 3/28/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation

protocol CountDownDelegate {
    func startTimer()
    func updateTimer(_ time: String)
    func endTimer()
}

class CountDownTimer {

    private var countdownTimer: Timer!
    private var seconds = 1
    var delegeta: CountDownDelegate?

    init(seconds: Int) {
        self.seconds = seconds
    }

    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        self.delegeta?.startTimer()
    }

    @objc private func updateTimer() {
        if seconds != 0 {
            seconds -= 1
            let text = "(\(timeFormatted(seconds).tenthNumOfSeconds + timeFormatted(seconds).decimalNumOfSeconds))"
            self.delegeta?.updateTimer(text)
        } else {
            endTimer()
        }
    }

    func endTimer() {
        countdownTimer.invalidate()
        self.delegeta?.endTimer()
    }

    private func timeFormatted(_ totalSeconds: Int) -> (tenthNumOfSeconds: String, decimalNumOfSeconds: String) {
        let tenthNumOfSecods: Int = totalSeconds / 10
        let decimalNumOfSecods: Int = (totalSeconds % 10)
        return (String(tenthNumOfSecods), String(decimalNumOfSecods))
    }

    deinit {
        self.endTimer()
    }


}
