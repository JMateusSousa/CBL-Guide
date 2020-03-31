#!/usr/bin/env swift
//
//  main.swift
//  ConsultaCBL
//
//  Created by Joseph on 10/03/20.
//  Copyright © 2020 José Mateus Azevedo de Sousa. All rights reserved.
//

/*
 Futuros updates
 - Organizar o codigo
 - Limpar os comments
 - Mudar as variaveis pra Int
 - Fazer os arquivos de texto
 */

import AppKit
import Foundation

var commands = ["zero", "One", "Two", "three"]
var rec = Recognizer(commands: commands)
rec.start()
while true{}

let url = URL(string: "file:///Users/Joseph/Documents/Mateus/Academy/CBLGuide/Files")

//  Funções
let loop = RunLoop.current
let synth = NSSpeechSynthesizer()

func startRecognizer(){
    rec.s
}

func speech(_ text: String) {
    synth.startSpeaking(text)
    let mode = loop.currentMode ?? RunLoop.Mode.default
    while loop.run(mode: mode, before: NSDate(timeIntervalSinceNow: 0.9) as Date)
        && synth.isSpeaking {}
}

func access(filename: String){
    printInfo(filePath: filename)
}

//func printInfo(filePath: String){
//  if let path = Bundle.main.path(forResource: filePath, ofType: nil) {
//    do {
//        let text = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
//        print(text)
//    } catch {
//        print("Failed to read text from \(filePath)")
//    }
//  } else {
//    print("Failed to load file from app bundle \(filePath)")
//  }
//}

func printInfo(filePath: String){
    let arquivoURL = url?.appendingPathComponent(filePath)
    do {
        let fileContent = try String(contentsOf: arquivoURL!, encoding: .utf8)
        print(fileContent)
        speech(fileContent)
    }
    catch{
        print("Failed to read text from \(filePath)")
        //Gerar saídas de erro mais na frente
    }
}



func accessMenu(){
  var userInput: Int
  var topic = 0, screen = 0
  let verifyArray = [0, 1, 2, 3]  //  array para tratar erro de input
  while (screen >= 0 || topic != 0){
    access(filename: "GuiaCBL" + String(screen) + String(topic) + ".txt")
    let input = readLine()!
    let flag: Int! = Int(input)

    //  verifica se o usuário não digitou caracteres
    if flag == nil {
      print("Entrada inválida")
      continue
    }
    userInput = Int(input)!
      if verifyArray.contains(userInput){

      //  verifica se o usuário quer voltar
      if userInput == 0{

        //  verifica se está na screen de conteúdo
        //  se sim, volta para screen anterior
        if screen != 0 && topic != 0{
          topic = screen
          screen = 0
        }

        //  verifica se está na screen do meio
        //  se sim, volta para screen inicial
        else if topic != 0{
          topic = 0
        }

        //  verifica se está na screen inicial
        //  se sim, finaliza o programa
        else if screen == 0 && topic == 0{
          screen = -1
        }
      }

      //  o usuário está avançando no menu
      else{
        if topic == 0{
          topic = userInput

        }
        else if topic != 0{
          screen = topic
          topic = userInput
        }
      }
    }
    else{
      print("Entrada inválida")
    }
  }
  print("Saindo...")
}

//   Estrutura principal
//accessMenu()


