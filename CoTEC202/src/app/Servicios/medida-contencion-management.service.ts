import { Injectable } from '@angular/core';
import {ConstanteService} from '../Servicios/constante.service';
import {  HttpClient, HttpParams } from '@angular/common/http';
import {  HttpHeaders } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { MedidaContencion } from '../Modelos/medida-contencion.model';
import { Medidacontencionp } from '../Modelos/medidacontencionp.model';

@Injectable({
  providedIn: 'root'
})
export class MedidaContencionManagementService {

  medidaContencionList: MedidaContencion[];
  formData: MedidaContencion;
  medidaContencion: MedidaContencion;

  constructor(private http: HttpClient, private constante: ConstanteService) {
  }


  getMedida() {
    // tslint:disable-next-line: no-string-literal
    this.http.get(this.constante.rutaURL + '/api/GetMedidaContencion').toPromise().then
    (res => this.medidaContencionList = res as MedidaContencion[]);
  }

}


