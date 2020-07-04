import { Component, OnInit } from '@angular/core';
import { Paciente } from 'src/app/Modelos/paciente.model';
import { Pacientep } from 'src/app/Modelos/pacientep.model';
import { PacienteManagementService } from 'src/app/Servicios/paciente-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';

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
  pacientee: Pacientep;
  pacienteU: Paciente;
  closeResult = '';

  constructor(public service: PacienteManagementService, private formBuilder: FormBuilder,
              private modalService: NgbModal) { }

  ngOnInit(): void {
    this.service.getPacientes();
    this.generateForm();
    this.generateFormU();
  }

  generateForm(pacienteForm?: NgForm) {
    if (pacienteForm != null) {
      pacienteForm.reset();
    }
    this.pacientee = {
      cedula: '',
      fechaNacimiento: new Date('Ene 01 2020'),
      region: '',
      medicacion: '',
      patologia: '',
      nacionalidad: '',
      nombre: '',
      primerApellido: '',
      segundoApellido: '',
      estado: 1,
      internado: '',
      uci: '',
      fechaIngreso: new Date('Ene 01 2020'),
      idCentroHospitalario: 1
    };

  }

  generateFormU(updateForm?: NgForm) {
    if (updateForm != null) {
      updateForm.reset();
    }
    this.pacienteU = {
      idPaciente: 1,
      cedula: '',
      fechaNacimiento: new Date('Ene 01 2020'),
      region: '',
      medicacion: '',
      patologia: '',
      nacionalidad: '',
      nombre: '',
      primerApellido: '',
      segundoApellido: '',
      estado: 1,
      internado: '',
      uci: '',
      fechaIngreso: new Date('Ene 01 2020'),
      idCentroHospitalario: 1
    };

  }

  open(content) {
    this.modalService.open(content, {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }

  onSubmit(pacienteForm: NgForm) {
    console.log('Ingresado');
    this.service.postPacientes(this.pacientee);
    this.generateForm();
  }

  onUpdate(updateForm: NgForm) {
    console.log('Actualizado');
    console.log(this.pacienteU);
    this.service.putPacientes(this.pacienteU);
  }

  onDelete(idPaciente: number) {
    console.log('Deleted');
    this.service.deletePacientes(idPaciente);
   }

  selectId(paciente: Paciente) {
    this.pacienteU = paciente;
    console.log(this.pacienteU);
    console.log(this.pacienteU.idPaciente);
  }

}
