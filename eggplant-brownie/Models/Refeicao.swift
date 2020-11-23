//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Gabriel Petrovick on 02/11/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
    
    // Mark: - Atributos
    
        let nome: String
        let felicidade: Int
        var itens: Array<Item> = []

    // Mark: - Init

    init(nome: String, felicidade: Int, itens: [Item] = []) {
            self.nome = nome
            self.felicidade = felicidade
            self.itens = itens
        }
    
    // Mark: - Metodos
        
    func totalDeCalorias() -> Double {
            var total = 0.0
            
            for item in itens {
                total += item.calorias
            }
            return total
    }
    
    func detalhes() -> String {
        //tela de alerta implementado via codigo
        var mensagem = "Felicidade: \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
    }
}
