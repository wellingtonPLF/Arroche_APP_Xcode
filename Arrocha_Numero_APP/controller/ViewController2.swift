//
//  ViewController2.swift
//  Arrocha_Numero_APP
//
//  Created by SetsuHa ToAll on 14/11/20.
//  Copyright © 2020 SetsuHa ToAll. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var mensagem: String?
    var numeroR: String?
    
    @IBOutlet weak var resultado: UILabel!
    
    @IBOutlet weak var numero: UILabel!
    
    @IBAction func volta(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(self.mensagem == "Perdeu!"){
            view.backgroundColor = .red
        }
        else{
            view.backgroundColor = .green
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let msg = self.mensagem{
            self.resultado.text = msg
        }
        
        if let result = self.numeroR{
            self.numero.text = result
        }
    }
}
