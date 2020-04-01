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
    
    private func requestAccesibility() {
        fileReader.access(filename: "Accessibility.txt")
        let input = readLine()!
        if input == "1" {
            self.fileReader.setIsAccessible(isAccessible: true)
        }
        else {
            self.fileReader.setIsAccessible(isAccessible: false)
        }
    }
    
    func accessMenu() {
        requestAccesibility()
        var userInput: Int
        var topic = 0, screen = 0
        let verifyArray = [0, 1, 2, 3]  //  array para tratar erro de input
        while (screen >= 0 || topic != 0) {
            fileReader.access(filename: "GuiaCBL" + String(screen) + String(topic) + ".txt")
            let input = readLine()!
            let flag: Int! = Int(input)

            //  verifica se o usuário não digitou caracteres
            if flag == nil {
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
                    else if topic != 0 {
                        screen = topic
                        topic = userInput
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
