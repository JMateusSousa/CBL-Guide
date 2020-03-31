//
//  delegate.swift
//  CBLGuide
//
//  Created by Joseph on 31/03/20.
//  Copyright © 2020 Joseph Mateus. All rights reserved.
//

import Foundation
import AppKit

class Recognizer: NSObject, NSSpeechRecognizerDelegate {
    let rec = NSSpeechRecognizer()
    init (commands: [String]) {
        rec?.commands = commands
    }
    func speechRecognizer(_ sender: NSSpeechRecognizer, didRecognizeCommand command: String) {
        print("command: \(command)")
    }
    
    func start(){
        rec?.startListening()
        rec?.delegate = self
    }
    
    func stop(){
        rec?.stopListening()
    }
}
