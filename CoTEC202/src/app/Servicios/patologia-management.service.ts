import { Injectable } from '@angular/core';
import {ConstanteService} from '../Servicios/constante.service';
import {  HttpClient, HttpParams } from '@angular/common/http';
import {  HttpHeaders } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { Patologia } from '../Modelos/patologia.model';
import { Patologiap } from '../Modelos/patologiap.model';

@Injectable({
  providedIn: 'root'
})
export class PatologiaManagementService {

  patologiaList: Patologia[];
  formData: Patologia;
  patologia: Patologia;

  constructor(private http: HttpClient, private constante: ConstanteService) {
  }


  getPatologias() {
    // tslint:disable-next-line: no-string-literal
    this.http.get(this.constante.rutaURL + '/api/GetMedidaSanitarias').toPromise().then
    (res => this.patologiaList = res as Patologia[]);
  }

  deletePatologias(idPatologia: number) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };
    this.http.delete(this.constante.rutaURL + '/api/DeletePatologias/' + idPatologia ,
    httpOptions).toPromise();

  }

  postPatologias(patologiaData: Patologiap) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      nombre: patologiaData.nombre,
      descripcion: patologiaData.descripcion,
      tratamiento: patologiaData.tratamiento,
      sintomas: patologiaData.sintomas
    };
    this.http.post(this.constante.rutaURL + '/api/PostPatologias', body, httpOptions).toPromise();

  }


  putPatologias(patologiaData: Patologia) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      idPatologia: patologiaData.idPatologia,
      nombre: patologiaData.nombre,
      descripcion: patologiaData.descripcion,
      tratamiento: patologiaData.tratamiento,
      sintomas: patologiaData.sintomas
    };
    this.http.put(this.constante.rutaURL + '/api/PutPatologias', body, httpOptions).toPromise();
  }

  getPatologiaId(idPatologia: number) {
    this.http.get(this.constante.rutaURL + '/api/GetPatologia/' + idPatologia ).
    toPromise().then(res => this.patologia = res as Patologia);
  }


}

