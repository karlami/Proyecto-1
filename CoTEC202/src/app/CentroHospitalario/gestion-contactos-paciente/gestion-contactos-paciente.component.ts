import { Component, OnInit } from '@angular/core';
import { Contacto } from 'src/app/Modelos/contacto.model';
import { ContactoManagementService } from 'src/app/Servicios/contacto-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-gestion-contactos-paciente',
  templateUrl: './gestion-contactos-paciente.component.html',
  styleUrls: ['./gestion-contactos-paciente.component.css']
})
export class GestionContactosPacienteComponent implements OnInit {
  contactoList: Contacto[];
  contactoForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  contactoo: Contacto;
  contactoU: Contacto;

  constructor(public service: ContactoManagementService, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    // this.service.getPaquetes();
    this.generateForm();
  }

  generateForm(contactoForm?: NgForm) {
    if (contactoForm != null) {
      contactoForm.reset();
    }
    this.contactoo = {
        cedula: 1,
        nombre: '',
        primerApellido: '',
        segundoApellido: '',
        edad: 1,
        nacionalidad: '',
        region: '',
        patologias: [],
        correo: ''
    };

  }

  onSubmit(contactoForm: NgForm) {
    console.log('Ingresado');
    // this.service.postPaquetes(this.paquetee);
    this.generateForm();
  }

}
