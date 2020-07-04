import { Component, OnInit } from '@angular/core';
import { EstadoPaciente } from 'src/app/Modelos/estado-paciente.model';
import { PacienteManagementService } from 'src/app/Servicios/paciente-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';


@Component({
  selector: 'app-gestion-estado-pacientes',
  templateUrl: './gestion-estado-pacientes.component.html',
  styleUrls: ['./gestion-estado-pacientes.component.css']
})
export class GestionEstadoPacientesComponent implements OnInit {
  estadoList: EstadoPaciente[];
  estadoForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  estadoo: EstadoPaciente;
  estadoU: EstadoPaciente;
  closeResult = '';

  constructor(public service: PacienteManagementService, private formBuilder: FormBuilder,
              private modalService: NgbModal) { }

  ngOnInit(): void {
    // this.service.getPaquetes();
    this.generateForm();
  }

  generateForm(estadoForm?: NgForm) {
    if (estadoForm != null) {
      estadoForm.reset();
    }
    this.estadoo = {
        idPacienteEstado: 1,
        cedula: 1,
        estado: ''
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

  onSubmit(estadoForm: NgForm) {
    console.log('Ingresado');
    // this.service.postPaquetes(this.paquetee);
    this.generateForm();
  }

}
