import { Injectable } from '@angular/core';
import {ConstanteService} from '../Servicios/constante.service';
import {  HttpClient, HttpParams } from '@angular/common/http';
import {  HttpHeaders } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { Ubicacion } from '../Modelos/ubicacion.model';
import { Ubicacionp } from '../Modelos/ubicacionp.model';

@Injectable({
  providedIn: 'root'
})
export class UbicacionManagementService {

  ubicacionList: Ubicacion[];
  formData: Ubicacion;
  ubicacion: Ubicacion;

  constructor(private http: HttpClient, private constante: ConstanteService) {
  }


  getUbicaciones() {
    // tslint:disable-next-line: no-string-literal
    this.http.get(this.constante.rutaURL + '/api/GetUbicaciones').toPromise().then
    (res => this.ubicacionList = res as Ubicacion[]);
  }

  deleteUbicaciones(idUbicacion: number) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };
    this.http.delete(this.constante.rutaURL + '/api/DeleteUbicaciones/' + idUbicacion ,
    httpOptions).toPromise();

  }

  postUbicaciones(ubicacionData: Ubicacionp) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      region: ubicacionData.region,
      pais: ubicacionData.pais,
      continente: ubicacionData.continente
    };
    this.http.post(this.constante.rutaURL + '/api/PostUbicaciones', body, httpOptions).toPromise();

  }


  putUbicaciones(ubicacionData: Ubicacion) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      idUbicacion: ubicacionData.idUbicacion,
      region: ubicacionData.region,
      pais: ubicacionData.pais,
      continente: ubicacionData.continente
    };
    this.http.put(this.constante.rutaURL + '/api/PutUbicaciones', body, httpOptions).toPromise();
  }

  getUbicacionId(idUbicacion: number) {
    this.http.get(this.constante.rutaURL + '/api/GetUbicacion/' + idUbicacion ).
    toPromise().then(res => this.ubicacion = res as Ubicacion);
  }


}

