import { Component, OnInit } from '@angular/core';
import { Paciente } from 'src/app/Modelos/paciente.model';
import { PacienteManagementService } from 'src/app/Servicios/paciente-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-gestion-pacientes',
  templateUrl: './gestion-pacientes.component.html',
  styleUrls: ['./gestion-pacientes.component.css']
})
export class GestionPacientesComponent implements OnInit {
  pacienteList: Paciente[];
  pacienteForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  pacientee: Paciente;
  pacienteU: Paciente;

  constructor(public service: PacienteManagementService, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    // this.service.getPaquetes();
    this.generateForm();
  }

  generateForm(pacienteForm?: NgForm) {
    if (pacienteForm != null) {
      pacienteForm.reset();
    }
    this.pacientee = {
      cedula: 1,
      nombre: '',
      primerApellido: '',
      segundoApellido: '',
      edad: 1,
      nacionalidad: '',
      region: '',
      patologias: [],
      estado: '',
      medicacion: [],
      internado: false,
      UCI: false,
      fechaIngreso: new Date('Ene 01 2020')
    };

  }

  onSubmit(pacienteForm: NgForm) {
    console.log('Ingresado');
    // this.service.postPaquetes(this.paquetee);
    this.generateForm();
  }

}
