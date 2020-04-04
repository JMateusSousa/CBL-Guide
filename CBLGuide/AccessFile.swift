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
        let url = self.getRootURL()
        let arquivoURL = url.appendingPathComponent(filename)
        do {
            let fileContent = try String(contentsOf: arquivoURL, encoding: .utf8)
            if isAccessible {
                print(fileContent)
                speaker.speech(fileContent)
            }
            else {
                print(fileContent)
            }
        }
        catch {
            print("Failed to read text from \(filename)")
            //Gerar saídas de erro mais na frente
        }
    }
    
    func getRootURL() -> URL {
        let currentDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let bundleURL = URL(fileURLWithPath: "ResourcesBundle.bundle", relativeTo: currentDirectory)
        let bundle = Bundle(url: bundleURL)!
        let rootPath = bundle.url(forResource: nil, withExtension: "txt", subdirectory: nil)
        return (rootPath?.baseURL!)!
    }
}
