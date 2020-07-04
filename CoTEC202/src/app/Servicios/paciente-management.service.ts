import { Injectable } from '@angular/core';
import {ConstanteService} from '../Servicios/constante.service';
import {  HttpClient, HttpParams } from '@angular/common/http';
import {  HttpHeaders } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { Paciente } from '../Modelos/paciente.model';
import { Pacientep } from '../Modelos/pacientep.model';

@Injectable({
  providedIn: 'root'
})
export class PacienteManagementService {

  pacienteList: Paciente[];
  formData: Paciente;
  paciente: Paciente;

  constructor(private http: HttpClient, private constante: ConstanteService) {
  }


  getPacientes() {
    // tslint:disable-next-line: no-string-literal
    this.http.get(this.constante.rutaURL + '/api/GetPacientes').toPromise().then
    (res => this.pacienteList = res as Paciente[]);
  }

  deletePacientes(idPaciente: number) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };
    this.http.delete(this.constante.rutaURL + '/api/DeletePacientes/' + idPaciente ,
    httpOptions).toPromise();

  }

  postPacientes(pacienteData: Pacientep) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      cedula: pacienteData.cedula,
      fechaNacimiento: pacienteData.fechaNacimiento,
      region: pacienteData.region,
      medicacion: pacienteData.medicacion,
      patologias: pacienteData.patologia,
      nacionalidad: pacienteData.nacionalidad,
      nombre: pacienteData.nombre,
      primerApellido: pacienteData.primerApellido,
      segundoApellido: pacienteData.segundoApellido,
      estado: pacienteData.estado,
      internado: pacienteData.internado,
      uci: pacienteData.uci,
      fechaIngreso: pacienteData.fechaIngreso,
      idCentroHospitalario: pacienteData.idCentroHospitalario
    };
    this.http.post(this.constante.rutaURL + '/api/PostPacientes', body, httpOptions).toPromise();

  }


  putPacientes(pacienteData: Paciente) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      idPaciente: pacienteData.idPaciente,
      cedula: pacienteData.cedula,
      fechaNacimiento: pacienteData.fechaNacimiento,
      region: pacienteData.region,
      medicacion: pacienteData.medicacion,
      patologias: pacienteData.patologia,
      nacionalidad: pacienteData.nacionalidad,
      nombre: pacienteData.nombre,
      primerApellido: pacienteData.primerApellido,
      segundoApellido: pacienteData.segundoApellido,
      estado: pacienteData.estado,
      internado: pacienteData.internado,
      uci: pacienteData.uci,
      fechaIngreso: pacienteData.fechaIngreso,
      idCentroHospitalario: pacienteData.idCentroHospitalario
    };
    this.http.put(this.constante.rutaURL + '/api/PutPacientes', body, httpOptions).toPromise();
  }

  getPacienteId(idPaciente: number) {
    this.http.get(this.constante.rutaURL + '/api/GetPaciente/' + idPaciente ).
    toPromise().then(res => this.paciente = res as Paciente);
  }
}
