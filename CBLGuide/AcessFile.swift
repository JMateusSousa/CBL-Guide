//
//  AcessFile.swift
//  CBLGuide
//
//  Created by Joseph on 31/03/20.
//  Copyright © 2020 Joseph Mateus. All rights reserved.
//

import Foundation

class AcessFile {
    
    let speaker = Speaker()
    let url = URL(string: "file:///Users/Joseph/Documents/Mateus/Academy/CBLGuide/Files")

    func access(filename: String){
        let arquivoURL = url?.appendingPathComponent(filename)
        do {
            let fileContent = try String(contentsOf: arquivoURL!, encoding: .utf8)
            print(fileContent)
            speaker.speech(fileContent)
        }
        catch{
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
