//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Fabiana Petrovick on 30/11/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit


class RemoveRefeicaoViewController {
    //exemplo de closure classe toda
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        //botao de ok implementado via codigo
        let botaoCancelar = UIAlertAction(title: "cancelar", style: .cancel)
        alerta.addAction(botaoCancelar)
        
        //cria o botao remover na modal e remove refeicao
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
    }
}

