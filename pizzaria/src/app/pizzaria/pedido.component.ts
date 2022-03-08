import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-pedido',
  templateUrl: './pedido.component.html',
  styleUrls: ['./pedido.component.scss'],
})
export class Pedido implements OnInit {

  pizzaSelecionada: any;

  constructor(private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {

    this.route.queryParams.subscribe(params => {
      // estao sendo passados parametros?
      if (this.router.getCurrentNavigation().extras.state) {

        this.pizzaSelecionada = this.router.getCurrentNavigation().extras.state.pizzaSelecionada;
        
      console.log (this.router.getCurrentNavigation().extras.state.pizzaSelecionada);
      console.log (this.router.getCurrentNavigation().extras.state.bebidaSelecionada);
      }
      });

}

}
