//
//  Application.swift
//  CBLGuide
//
//  Created by Joseph on 01/04/20.
//  Copyright © 2020 Joseph Mateus. All rights reserved.
//

import Foundation

class Application {
    
    var fileReader = AccessFile()
    let speaker = Speaker()
    
    private func requestAccesibility() {
        fileReader.access(filename: "Accessibility.txt")
        var input: String
        repeat {
            print("Selected: ", separator: "", terminator: "")
            input = readLine()!
            switch input {
            case "1":
                self.fileReader.setIsAccessible(isAccessible: true)
            case "2":
               self.fileReader.setIsAccessible(isAccessible: false)
            default:
                print("Your input was invalid!. Please, try again.")
                speaker.speech("Your input was invalid!. Please, try again.")
                input = "0"
            }
        } while input == "0"
    }
    
    func accessMenu() {
        requestAccesibility()
        var userInput: Int
        var topic = 0, screen = 0
        let verifyArray = [0, 1, 2, 3]  //  array para tratar erro de input
        while (screen >= 0 || topic != 0) {
            fileReader.access(filename: "GuiaCBL\(screen)\(topic).txt")
            print("Selected: ", separator: "", terminator: "")
            let input = readLine()!

            //  verifica se o usuário não digitou caracteres
            if Int(input) == nil {
                print("Entrada inválida")
                continue
            }
            
            userInput = Int(input)!
            if verifyArray.contains(userInput) {

                //  verifica se o usuário quer voltar
                if userInput == 0 {

                    //  verifica se está na screen de conteúdo
                    //  se sim, volta para screen anterior
                    if screen != 0 && topic != 0 {
                        topic = screen
                        screen = 0
                    }

                    //  verifica se está na screen do meio
                    //  se sim, volta para screen inicial
                    else if topic != 0 {
                        topic = 0
                    }

                    //  verifica se está na screen inicial
                    //  se sim, finaliza o programa
                    else if screen == 0 && topic == 0 {
                        screen = -1
                    }
                }

                //  o usuário está avançando no menu
                else {
                    if topic == 0 {
                        topic = userInput
                    }
                        
                    //  quando o usuário chegar na informação e quiser sair
                    else if screen > 0 {
                        if userInput == 1{
                            (screen, topic) = (-1, 0)
                        }
                    }
                    //  o pulo do gato para entrar na informação requerida
                    else if topic != 0 {
                        (screen, topic) = (topic, userInput)
                    }
                }
        }
        else {
          print("Entrada inválida")
        }
      }
      print("Saindo...")
    }
}
