//
//  Item.swift
//  eggplant-brownie
//
//  Created by Fabiana Petrovick on 02/11/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    // Mark: - Atributos

        let nome: String
        let calorias: Double
        
    // Mark: - Init

        init(nome:String, calorias: Double) {
            self.nome = nome
            self.calorias = calorias
        }
}
