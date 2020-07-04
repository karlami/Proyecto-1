import { Injectable } from '@angular/core';
import {ConstanteService} from '../Servicios/constante.service';
import {  HttpClient, HttpParams } from '@angular/common/http';
import {  HttpHeaders } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { Medicamento } from '../Modelos/medicamento.model';
import { Medicamentop } from '../Modelos/medicamentop.model';

@Injectable({
  providedIn: 'root'
})
export class MedicamentoManagementService {

  medicamentoList: Medicamento[];
  formData: Medicamento;
  medicamento: Medicamento;

  constructor(private http: HttpClient, private constante: ConstanteService) {
  }


  getMedicamentos() {
    // tslint:disable-next-line: no-string-literal
    this.http.get(this.constante.rutaURL + '/api/GetMedicamentos').toPromise().then
    (res => this.medicamentoList = res as Medicamento[]);
  }

  deleteMedicamentos(idMedicamento: number) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };
    this.http.delete(this.constante.rutaURL + '/api/DeleteMedicamentos/' + idMedicamento ,
    httpOptions).toPromise();

  }

  postMedicamento(medicamentoData: Medicamentop) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      nombre: medicamentoData.nombre,
      descripcion: medicamentoData.descripcion,
      casaFarmaceutica: medicamentoData.casaFarmaceutica
    };
    this.http.post(this.constante.rutaURL + '/api/PostMedicamentos', body, httpOptions).toPromise();

  }


  putMedicamentos(medicamentoData: Medicamento) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      idMedicamento: medicamentoData.idMedicamento,
      nombre: medicamentoData.nombre,
      descripcion: medicamentoData.descripcion,
      casaFarmaceutica: medicamentoData.casaFarmaceutica
    };
    this.http.put(this.constante.rutaURL + '/api/PutMedicamentos', body, httpOptions).toPromise();
  }

  getMedicamentoId(idMedicamento: number) {
    this.http.get(this.constante.rutaURL + '/api/GetMedicamento/' + idMedicamento ).
    toPromise().then(res => this.medicamento = res as Medicamento);
  }


}
