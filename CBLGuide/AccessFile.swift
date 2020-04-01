//
//  AcessFile.swift
//  CBLGuide
//
//  Created by Joseph on 31/03/20.
//  Copyright © 2020 Joseph Mateus. All rights reserved.
//

import Foundation

class AccessFile {
    
    let speaker = Speaker()
    let url = URL(string: "file:///Users/Joseph/Documents/Mateus/Academy/CBLGuide/Files")
    var isAccessible = true
    
    //  Método para selecionar o modo de operação do programa.
    //  Se isAccessible = true, a operação é de modo acessível.
    //  Senão, a operação não é de modo acessível.
    func setIsAccessible(isAccessible: Bool) {
        self.isAccessible = isAccessible
    }
    
    // Método access recebe o nome do arquivo, lê o arquivo e chama o método speech
    // da classe Speaker para ditar o conteúdo do arquivo.
    func access(filename: String){
        let arquivoURL = url?.appendingPathComponent(filename)
        do {
            let fileContent = try String(contentsOf: arquivoURL!, encoding: .utf8)
            if isAccessible {
                 print(fileContent)
                speaker.speech(fileContent)
                print("Selected: ", separator: "", terminator: "")
            }
            else {
                print(fileContent)
                print("Selected: ", separator: "", terminator: "")
            }
        }
        catch {
            print("Failed to read text from \(filename)")
            //Gerar saídas de erro mais na frente
        }
    }
    
    //  Acessa arquivo a partir no diretório do projeto
    //
    //func acess(filePath: String){
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
}
