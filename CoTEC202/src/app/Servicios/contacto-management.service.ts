import { Injectable } from '@angular/core';
import {ConstanteService} from '../Servicios/constante.service';
import {  HttpClient, HttpParams } from '@angular/common/http';
import {  HttpHeaders } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { Contacto } from '../Modelos/contacto.model';
import { Contactop } from '../Modelos/contactop.model';

@Injectable({
  providedIn: 'root'
})
export class ContactoManagementService {

  contactoList: Contacto[];
  formData: Contacto;
  contacto: Contacto;

  constructor(private http: HttpClient, private constante: ConstanteService) {
  }

  submitContactos(formData: Contacto) {
    return this.http.post(this.constante.rutaURL + '/api/PostContactos', formData);
  }

  getContactos() {
    // tslint:disable-next-line: no-string-literal
    this.http.get(this.constante.rutaURL + '/api/GetContactos').toPromise().then
    (res => this.contactoList = res as Contacto[]);
  }

  deleteContactos(idContacto: number) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };
    this.http.delete(this.constante.rutaURL + '/api/DeleteContactos/' + idContacto ,
    httpOptions).toPromise();

  }

  postContactos(contactoData: Contactop) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      cedula: contactoData.cedula,
      fechaNacimiento: contactoData.fechaNacimiento,
      idUbicacion: contactoData.idUbicacion,
      patologia: contactoData.patologia,
      nacionalidad: contactoData.nacionalidad,
      nombre: contactoData.nombre,
      primerApellido: contactoData.primerApellido,
      segundoApellido: contactoData.segundoApellido,
      correo: contactoData.correo,
      idPaciente: contactoData.idPaciente
    };
    this.http.post(this.constante.rutaURL + '/api/PostContactos', body, httpOptions).toPromise();

  }


  putContactos(contactoData: Contacto) {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type':  'application/json'
      })
    };
    const body = {
      idContacto: contactoData.idContacto,
      cedula: contactoData.cedula,
      fechaNacimiento: contactoData.fechaNacimiento,
      idUbicacion: contactoData.idUbicacion,
      patologia: contactoData.patologia,
      nacionalidad: contactoData.nacionalidad,
      nombre: contactoData.nombre,
      primerApellido: contactoData.primerApellido,
      segundoApellido: contactoData.segundoApellido,
      correo: contactoData.correo,
      idPaciente: contactoData.idPaciente
    };
    this.http.put(this.constante.rutaURL + '/api/PutContactos', body, httpOptions).toPromise();
  }

  getContactoId(idContacto: string) {
    this.http.get(this.constante.rutaURL + '/api/GetContacto/' + idContacto ).
    toPromise().then(res => this.contacto = res as Contacto);
  }

}
