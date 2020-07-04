import { Injectable } from '@angular/core';
import {ConstanteService} from '../Servicios/constante.service';
import {  HttpClient, HttpParams } from '@angular/common/http';
import {  HttpHeaders } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { CentroHospitalario } from '../Modelos/centro-hospitalario.model';
import { Centrohospitalariop } from '../Modelos/centrohospitalariop.model';

@Injectable({
  providedIn: 'root'
})
export class CentroHospitalarioManagementService {

  centroList: CentroHospitalario[];
  formData: CentroHospitalario;
  centro: CentroHospitalario;

  constructor(private http: HttpClient, private constante: ConstanteService) {
  }


  getCentroHospitalarios() {
    // tslint:disable-next-line: no-string-literal
    this.http.get(this.constante.rutaURL + '/api/GetCentroHospitalarios').toPromise().then
    (res => this.centroList = res as CentroHospitalario[]);
  }

  deleteCentroHospitalarios(idCentroHospitalario: number) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };
    this.http.delete(this.constante.rutaURL + '/api/DeleteCentroHospitalarios/' + idCentroHospitalario ,
    httpOptions).toPromise();

  }

  postCentroHospitalarios(postForm: Centrohospitalariop) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      nombre: postForm.nombre,
      capacidad: postForm.capacidad,
      capacidadUci: postForm.capacidadUci,
      director: postForm.director,
      contacto: postForm.contacto,
      pais: postForm.pais,
      region: postForm.region
    };
    this.http.post(this.constante.rutaURL + '/api/PostCentroHospitalarios', body, httpOptions).toPromise();

  }


  putCentroHospitalarios(centroData: CentroHospitalario) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      idCentroHospitalario: centroData.idCentroHospitalario,
      nombre: centroData.nombre,
      capacidad: centroData.capacidad,
      capacidadUci: centroData.capacidadUci,
      director: centroData.director,
      contacto: centroData.contacto,
      region: centroData.region,
      pais: centroData.pais
    };
    this.http.put(this.constante.rutaURL + '/api/PutCentroHospitalarios', body, httpOptions).toPromise();
  }

  getCentroHospitalarioId(idCentroHospitalario: string) {
    this.http.get(this.constante.rutaURL + '/api/GetCentroHospitalario/' + idCentroHospitalario ).
    toPromise().then(res => this.centro = res as CentroHospitalario);
  }


}
