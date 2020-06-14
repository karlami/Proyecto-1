import { Component, OnInit } from '@angular/core';
import { Paciente } from 'src/app/Modelos/paciente.model';
import { PacienteManagementService } from 'src/app/Servicios/paciente-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';


@Component({
  selector: 'app-gestion-estado-pacientes',
  templateUrl: './gestion-estado-pacientes.component.html',
  styleUrls: ['./gestion-estado-pacientes.component.css']
})
export class GestionEstadoPacientesComponent implements OnInit {
  estadoList: Paciente[];
  estadoForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  estadoo: Paciente;
  estadoU: Paciente;

  constructor(public service: PacienteManagementService, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    // this.service.getPaquetes();
    // this.generateForm();
  }

  /*generateForm(estadoForm?: NgForm) {
    if (estadoForm != null) {
      estadoForm.reset();
    }
    this.estadoo = {
        cedula: 1,
        nombre: '',
        estado: ''
    };

  }*/
}
