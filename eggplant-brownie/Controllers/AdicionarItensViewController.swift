//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Gabriel Petrovick on 15/11/20.
//  Copyright © 2020 Fabiana Petrovick. All rights reserved.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
    }

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
        required init?(coder aDcoder: NSCoder) {
            super.init(coder: aDcoder)
    }
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    
    //clica no Adicionar da view segura o ctrl e arrasta ate aqui
    @IBAction func adicionarItem(_ sender: Any) {
        
//        if let nome = nomeTextField.text {
//            nome
//        } ou
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else {
            return
        }
        if let numeroDeCalorias = Double(calorias) {
        //navegar p proxima tela: navigationController.push()
        //voltar p a tela anterior: navigationcontroller.pop()
        let item = Item(nome: nome, calorias: numeroDeCalorias)
            delegate?.add(item)
        navigationController?.popViewController(animated: true)
        }
    }
}
