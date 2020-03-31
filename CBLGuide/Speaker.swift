//
//  Speaker.swift
//  CBLGuide
//
//  Created by Joseph on 31/03/20.
//  Copyright © 2020 Joseph Mateus. All rights reserved.
//

import Foundation
import AppKit

class Speaker {
    
    let loop = RunLoop.current
    let synth = NSSpeechSynthesizer()

    func speech(_ text: String) {
        synth.startSpeaking(text)
        let mode = loop.currentMode ?? RunLoop.Mode.default
        while loop.run(mode: mode, before: NSDate(timeIntervalSinceNow: 0.9) as Date)
            && synth.isSpeaking {}
    }
}
