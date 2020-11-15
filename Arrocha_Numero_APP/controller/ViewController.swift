//
//  ViewController.swift
//  Arrocha_Numero_APP
//
//  Created by SetsuHa ToAll on 14/11/20.
//  Copyright © 2020 SetsuHa ToAll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var jogo : numeroAleatorio?
    
    
    @IBOutlet weak var valorSlide: UILabel!
    @IBOutlet weak var intervalo: UILabel!
    
    @IBOutlet weak var escolha: UISlider!
    
    //Mostrando o Numero ao dar um slide
    @IBAction func slide(_ sender: Any) {
        self.valorSlide.text = String(Int(self.escolha.value))
    }
    
    //Testar se o valor is valido, se sim ele vai atualizar os intervalos
    //and then vai ver se ele ganhou ou nao a partida
    @IBAction func btVai(_ sender: Any) {
        if let jogo = self.jogo{
            if(jogo.chuteValido(chute: Int(self.escolha.value))){
                self.jogo?.jogar(chute: Int(self.escolha.value))
                self.atualizarIntervalos()
                if(jogo.dif() == 2){
                    //Ganhou
                    self.transicao(msg: "Ganhou!")
                    self.novoJogo()
                }
            }
            else{
                //Perdeu
                self.transicao(msg: "Perdeu!")
                self.novoJogo()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.novoJogo()
    }
    
    func novoJogo(){
        self.jogo = numeroAleatorio(inicio:0,fim:100)
        self.escolha.value = 1
        self.valorSlide.text = String(Int(self.escolha.value))
        atualizarIntervalos()
        print(self.jogo!.getnumber())
    }
    
    func atualizarIntervalos(){
        self.intervalo.text = "[\(self.jogo!.getInicio()),\(self.jogo!.getFim())]"
    }
    
    func transicao(msg:String){
        let cloneSC = self.storyboard?.instantiateViewController(withIdentifier: "win_defeat") as! ViewController2
        cloneSC.mensagem = msg
        cloneSC.numeroR = "Valor Sorteado: \(self.jogo!.getnumber())"
        self.present(cloneSC, animated: true, completion: nil)
    }
}
