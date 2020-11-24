//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Fabiana Petrovick on 07/11/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit
//Manipulando a tabela
class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Comida Japonesa", felicidade: 5)]
    
    //manipula as linhas
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    //manipula o conteudo
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        //pegar o gesto de toque de dedo
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    //Metodo...Parametro : nome da variavel
    //chama o add e adiciona e atualiza a tabela
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    //pegar o gesto de toque de dedo
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
            //botao de ok implementado via codigo
            let botaoCancelar = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            
            alerta.addAction(botaoCancelar)
            
            present(alerta, animated: true, completion: nil)
        }
    }
   //navega entre as telas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //para trabalhar com varias telas aconcelha-se usar o identifier
        if segue.identifier == "adicionar" {
        
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
            }
        }
    }
}
//listas as refeicoes é o arquivo RefeicoesTableViewController e ele comunica com o protocol e ele comunica com o arquivo ViewController, ou seja o protocol // (delegate) faz essa ponte de comunicacao
