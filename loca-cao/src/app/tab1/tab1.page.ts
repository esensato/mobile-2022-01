import { ViewChild, ElementRef, Component } from '@angular/core';
import { Geolocation } from '@awesome-cordova-plugins/geolocation/ngx';

declare var google:any;

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page {

  mapa:any;

  @ViewChild('mapa', {read: ElementRef, static: false}) refMapa: ElementRef;
  constructor(private geolocation:Geolocation) {}

  // ciclo de vida componente ionic
  ionViewDidEnter() {

    this.geolocation.getCurrentPosition().then((param) => {

      const pos = new google.maps.LatLng(param.coords.latitude, param.coords.longitude);
      const opcoes = {center: pos, zoom: 15, disableDefaultUI: true};
      this.mapa = new google.maps.Map(this.refMapa.nativeElement, opcoes)

          // permite o click sobre o mapa para obter a coordenada LatLng
    this.mapa.addListener("click", (mapsMouseEvent) => {

      var myLatlng = new google.maps.LatLng(mapsMouseEvent.latLng.lat, mapsMouseEvent.latLng.lng);

      let novo = new google.maps.Marker({
        position: myLatlng,
        title: "Titulo"
        });
        console.log( JSON.stringify(mapsMouseEvent.latLng.toJSON(), null, 2));
        novo.setMap(this.mapa);

      })
  
      // adiciona um marcador
      const posESPM = new google.maps.LatLng(param.coords.latitude, param.coords.longitude);
      let marcador = new google.maps.Marker({
        position: posESPM,
        title: "ESPM Tech"
        });
      
      // responde ao evento de click e exibe info window
      marcador.addListener('click', () => {
        let conteudo = "<div id='conteudo'><h2>" + marcador.title + "</h2><p>Bem vindo ao curso de ionic!</p></div>";
        let info = new google.maps.InfoWindow({content: conteudo});
        info.open(this.mapa, marcador);
      });
  
      // adiciona o marcador ao mapa
      marcador.setMap(this.mapa);
    })



  }

}
