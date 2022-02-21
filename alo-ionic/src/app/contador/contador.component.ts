import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-contador',
  templateUrl: './contador.component.html',
  styleUrls: ['./contador.component.scss'],
})
export class ContadorComponent implements OnInit {

  numero:number = 0;
  novoNumero:number = 0;

  constructor() { }

  ngOnInit() {}

  executarIncremento() {
   
    this.numero++;

  }

  atualizarNumero() {
    this.numero = this.novoNumero;
    this.novoNumero = 0;
  }

}
