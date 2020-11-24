//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Gabriel Petrovick on 23/11/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    // = "Desculpe" valor padrao que sera informado quando nao for repassado nos metodos
    func exibe(titulo: String = "Atenção", mensagem: String){
        let alerta = UIAlertController(title: titulo, message:  mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
