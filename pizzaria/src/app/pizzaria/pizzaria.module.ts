import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Cardapio } from './cardapio';

import { RouterModule, Routes } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';

const routes: Routes = [
  {
    path: 'cardapio',
    component: Cardapio
  }
];

@NgModule({
  declarations: [Cardapio],
  imports: [
    CommonModule, RouterModule.forChild(routes), HttpClientModule
  ],
  exports: [Cardapio]
})
export class PizzariaModule { }
