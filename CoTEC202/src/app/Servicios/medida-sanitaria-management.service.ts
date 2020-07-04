import { Injectable } from '@angular/core';
import {ConstanteService} from '../Servicios/constante.service';
import {  HttpClient, HttpParams } from '@angular/common/http';
import {  HttpHeaders } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { MedidaSanitaria } from '../Modelos/medida-sanitaria.model';
import { Medidasanitariap } from '../Modelos/medidasanitariap.model';

@Injectable({
  providedIn: 'root'
})
export class MedidaSanitariaManagementService {

  medidaSanitariaList: MedidaSanitaria[];
  formData: MedidaSanitaria;
  medidaSanitaria: MedidaSanitaria;
  sanitariaList: MedidaSanitaria[];

  constructor(private http: HttpClient, private constante: ConstanteService) {
  }


  getMedida() {
    // tslint:disable-next-line: no-string-literal
    this.http.get(this.constante.rutaURL + '/api/GetMedidaSanitarias').toPromise().then
    (res => this.medidaSanitariaList = res as MedidaSanitaria[]);
  }

  deleteMedida(idMedidaSanitaria: number) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };
    this.http.delete(this.constante.rutaURL + '/api/DeleteMedidaSanitarias/' + idMedidaSanitaria ,
    httpOptions).toPromise();

  }

  postMedida(medidaData: Medidasanitariap) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      nombre: medidaData.nombre,
      descripcion: medidaData.descripcion
    };
    this.http.post(this.constante.rutaURL + '/api/PostMedidaSanitarias', body, httpOptions).toPromise();

  }


  putMedida(medidaData: MedidaSanitaria) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      idMedidaSanitaria: medidaData.idMedidaSanitaria,
      nombre: medidaData.nombre,
      descripcion: medidaData.descripcion
    };
    this.http.put(this.constante.rutaURL + '/api/PutMedidaSanitarias', body, httpOptions).toPromise();
  }

  getMedidaId(idMedidaSanitaria: number) {
    this.http.get(this.constante.rutaURL + '/api/GetMedidaSanitaria/' + idMedidaSanitaria ).
    toPromise().then(res => this.medidaSanitaria = res as MedidaSanitaria);
  }


}

