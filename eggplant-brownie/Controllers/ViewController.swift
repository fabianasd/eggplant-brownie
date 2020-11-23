//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Fabiana Petrovick on 31/10/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao) 
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    //MARK: - IBOutlet
         
    @IBOutlet weak var itensTableView: UITableView!
    
    //MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
  //  var itens: [String] = ["Molho de tomate" , "Queijo", "Molho apimentado", "Mangericão"]
    var itens = [Item(nome:"Molho de Tomate", calorias: 40.0),
                 Item(nome:"Queijo", calorias: 40.0),
                 Item(nome:"Molho apimentado", calorias: 40.0),
                 Item(nome:"Mangericão", calorias: 40.0)]
    var itensSelecionados: [Item] = []
    
    //MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    //MARK: - View life cycle
    // metodo usado para quando a view acabou de ser carregada...cria o botão Adicionar da tela 2
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
    @objc func adicionarItem() {
        let adicionarItensviewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensviewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        itensTableView.reloadData()
        
    }

    //MARK: - UITableViewDataSource
    //DataSource e Delegate tem que selecionar no Main a conexão

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
      }
    
    //MARK: - UITableViewDelegate
    //DataSource e Delegate tem que selecionar no Main a conexão
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // if let permite usar a celula apenas aqui dentro e o guard let pode ser acessado em qualquer lugar
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        } else {
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
                
                //teste: de selecao de itens...imprime no console os itens que estão selecionados
                
                for itemSelecionado in itensSelecionados {
                    print(itemSelecionado.nome)
                }
            }
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
// if let permite usar a celula apenas aqui dentro e o guard let pode ser acessado em qualquer lugar

//        if let nomeDaRefeicao = nomeTextField?.text,let felicidadeDaRefeicao =
//            felicidadeTextField?.text {
//            let nome = nomeDaRefeicao
//            if let felicidade = Int(felicidadeDaRefeicao){
//            let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//
//            print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
//        } else {
//            print("erro ao tentar criar a refeicao")
//            }
//        }

        
//outra sugestão
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let
            felicidade = Int(felicidadeDaRefeicao) else { return }
        //exemplo de metodo construtor Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        
// print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
    //manipulando a tabela
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}
