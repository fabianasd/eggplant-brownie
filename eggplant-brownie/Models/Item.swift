//
//  Item.swift
//  eggplant-brownie
//
//  Created by Fabiana Petrovick on 02/11/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
        
    // Mark: - Atributos
    
    let nome: String
    let calorias: Double
    
    // Mark: NSCoding
    //salvar codificando e depois decodificando
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        calorias = aDecoder.decodeDouble(forKey: "calorias")
    }
    // Mark: - Init
    
    init(nome:String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
