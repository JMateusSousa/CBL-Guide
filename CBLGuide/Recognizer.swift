//
//  delegate.swift
//  CBLGuide
//
//  Created by Joseph on 31/03/20.
//  Copyright © 2020 Joseph Mateus. All rights reserved.
//

import Foundation
import AppKit

//  Classe implementada para, quando o modo de operação for acessível,
//  o usuário poder realizar os comandos por voz.
class Recognizer: NSObject, NSSpeechRecognizerDelegate {
    
    let rec = NSSpeechRecognizer()!
    var command: String = ""
    
    func speechRecognizer(_ sender: NSSpeechRecognizer, didRecognizeCommand command: String) {
        //rec.blocksOtherRecognizers = true
        self.command = command
        //rec.blocksOtherRecognizers = false
    }
    
    func start() {
        //   Comandos existentes no programa.
        rec.commands = ["0", "1", "2", "3"]
        rec.delegate = self
        rec.startListening()
    }
    
    func stop() {
        rec.stopListening()
    }
    
    func getCommand() -> String {
        sleep(5)
        return command
    }
    
}
