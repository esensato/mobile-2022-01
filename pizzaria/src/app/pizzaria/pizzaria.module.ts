import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Cardapio } from './cardapio';

import { RouterModule, Routes } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { Pedido } from './pedido.component';

const routes: Routes = [
  {
    path: 'cardapio',
    component: Cardapio
  },
  {
    path: 'pedido',
    component: Pedido
  }
];

@NgModule({
  declarations: [Cardapio, Pedido],
  imports: [
    CommonModule, RouterModule.forChild(routes), HttpClientModule
  ],
  exports: [Cardapio, Pedido]
})
export class PizzariaModule { }
