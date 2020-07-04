import { Injectable } from '@angular/core';
import {ConstanteService} from '../Servicios/constante.service';
import {  HttpClient, HttpParams } from '@angular/common/http';
import {  HttpHeaders } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { MedidasPais } from '../Modelos/medidas-pais.model';
import { Medidapaisp } from '../Modelos/medidapaisp.model';

@Injectable({
  providedIn: 'root'
})
export class MedidasPaisManagementService {

  medidaPaisList: MedidasPais[];
  formData: MedidasPais;
  medidaPais: MedidasPais;

  constructor(private http: HttpClient, private constante: ConstanteService) {
  }


  getMedida() {
    // tslint:disable-next-line: no-string-literal
    this.http.get(this.constante.rutaURL + '/api/GetMedidasPais').toPromise().then
    (res => this.medidaPaisList = res as MedidasPais[]);
  }


  postMedida(medidaData: Medidapaisp) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      estado: medidaData.estado,
      pais: medidaData.pais,
      meididas: medidaData.medidas,
      fechaInicio: medidaData.fechaInicio,
      fechaFinal: medidaData.fechaFinal
    };
    this.http.post(this.constante.rutaURL + '/api/PostMedidasPais', body, httpOptions).toPromise();

  }

}
