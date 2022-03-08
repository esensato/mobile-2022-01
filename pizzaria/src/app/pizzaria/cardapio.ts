import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router, NavigationExtras } from '@angular/router';

const URL = 'https://raw.githubusercontent.com/esensato/mobile-2022-01/main/services/lista-pizza.json';

@Component({
selector: 'app-cardapio',
templateUrl: './cardapio.html',
styleUrls: ['./cardapio.scss'],
})

export class Cardapio implements OnInit {

    cardapio: any = [];
    pizzaSelecionada: any;
    bebidaSelecionada: any;
    ocultarPizzas = false;

    constructor (private router: Router, private http: HttpClient){ }

    ngOnInit() {

         // subscribe nao bloqueia a execucao do codigo (assincrono)
        this.http.get(URL).subscribe((resposta) => {
            console.log(resposta);
            this.cardapio = resposta;   
        })

     }

     selPizza(item) {
         this.pizzaSelecionada = item;
         this.ocultarPizzas = true;
     }

     selBebida(item) {
         this.bebidaSelecionada = item;
         let navigationExtras: NavigationExtras = {
            state: {
            pizzaSelecionada: this.pizzaSelecionada,
            bebidaSelecionada: this.bebidaSelecionada
            }
            };

            this.router.navigate(['pizzaria/pedido'], navigationExtras);

     }

}
