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
    let rec = NSSpeechRecognizer()
    override init () {
        
        //   Comandos existentes no programa.
        rec!.commands = ["Zero", "One", "Two", "three"]
    }
    
    func speechRecognizer(_ sender: NSSpeechRecognizer, didRecognizeCommand command: String) {
        print("command: \(command)")
    }
    
    func start() {
        rec!.delegate = self
        rec!.startListening()
    }
    
    func stop() {
        rec!.stopListening()
    }
}
