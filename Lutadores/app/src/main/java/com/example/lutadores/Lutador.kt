package com.example.lutadores

import java.util.Random

class Lutador (var nome:String = "Lutador") {

    var ataque = 0
    var defesa = 0

    init{
        val random = Random()
        this.ataque = random.nextInt(10) + 1
        this.defesa = random.nextInt(10) + 1
        println ("Ataque: ${this.ataque}, defesa = ${this.defesa}")
    }

    fun atacar(adversario:Lutador):String {
        if (this.ataque > adversario.defesa) {
            return this.nome
        } else if (this.ataque == adversario.defesa) {
            return "EMPATE"
        } else {
            return adversario.nome
        }
    }
}