//
//  Timer.swift
//  DrawingsApp
//
//  Created by FARIT GATIATULLIN on 18.07.2021.
//

import Foundation

class MyTimer: NSObject {
    var timer: Timer?
    var time = 1.0
    var delegate: PaletteButton?

    @objc func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: time,
                                     target: self,
                                     selector: #selector(eventWith(timer:)), userInfo: nil,
                                     repeats: false)
    }
    
    @objc func setTime(time: Double) {
        self.time = time
    }
    @objc func setDelegate(button: PaletteButton) {
        self.delegate = button
    }

    @objc func eventWith(timer: Timer!) {
        delegate!.timerFired()

    }

}
