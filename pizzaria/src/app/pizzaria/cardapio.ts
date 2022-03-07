import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

const URL = 'https://raw.githubusercontent.com/esensato/mobile-2022-01/main/services/lista-pizza.json';

@Component({
selector: 'app-cardapio',
templateUrl: './cardapio.html',
styleUrls: ['./cardapio.scss'],
})

export class Cardapio implements OnInit {

    cardapio: any = [];
    pizzaSelecionada: any;

    constructor (private http: HttpClient){ }

    ngOnInit() {

         // subscribe nao bloqueia a execucao do codigo (assincrono)
        this.http.get(URL).subscribe((resposta) => {
            console.log(resposta);
            this.cardapio = resposta;   
        })

     }

     selPizza(item) {
         this.pizzaSelecionada = item;
     }

}
