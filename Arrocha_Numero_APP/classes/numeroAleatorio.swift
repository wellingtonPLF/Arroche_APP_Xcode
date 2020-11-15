//
//  numeroAleatorio.swift
//  Arrocha_Numero_APP
//
//  Created by SetsuHa ToAll on 14/11/20.
//  Copyright © 2020 SetsuHa ToAll. All rights reserved.
//

import Foundation

class numeroAleatorio{
    private var inicio: Int
    private var fim: Int
    private var numeroR : Int
    
    init(inicio: Int,fim : Int){
        self.inicio = inicio
        self.fim = fim
        self.numeroR = Int.random(in: self.inicio+1..<self.fim)
    }
    
    func getInicio() -> Int{
        return self.inicio
    }
    
    func getFim() -> Int{
        return self.fim
    }
    
    func getnumber() -> Int{
        return self.numeroR
    }
    
    func dif() -> Int{
        return self.fim - self.inicio
    }
    
    func chuteValido(chute: Int) -> Bool{
        if(chute<=self.inicio) || (chute >= self.fim){
            return false
        }
        else if(chute == self.numeroR){
            return false
        }
        return true
    }
    
    func jogar(chute: Int){
        if(chute < self.numeroR){
            self.inicio = chute
        }
        else{
            self.fim = chute
        }
    }
}
