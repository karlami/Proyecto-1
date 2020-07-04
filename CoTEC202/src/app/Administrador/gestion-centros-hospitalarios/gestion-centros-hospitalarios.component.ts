import { Component, OnInit } from '@angular/core';
import { CentroHospitalario } from 'src/app/Modelos/centro-hospitalario.model';
import { Centrohospitalariop } from 'src/app/Modelos/centrohospitalariop.model';
import { CentroHospitalarioManagementService } from 'src/app/Servicios/centro-hospitalario-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';


@Component({
  selector: 'app-gestion-centros-hospitalarios',
  templateUrl: './gestion-centros-hospitalarios.component.html',
  styleUrls: ['./gestion-centros-hospitalarios.component.css']
})
export class GestionCentrosHospitalariosComponent implements OnInit {
  hospitalList: CentroHospitalario[];
  hospitalForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  hospitall: Centrohospitalariop;
  hospitalU: CentroHospitalario;
  closeResult = '';

  constructor(public service: CentroHospitalarioManagementService, private formBuilder: FormBuilder,
              private modalService: NgbModal) { }

  ngOnInit(): void {
    this.service.getCentroHospitalarios();
    this.generateFormU();
    this.generateForm();
  }

  generateFormU(hospitalForm?: NgForm) {
    if (hospitalForm != null) {
      hospitalForm.reset();
    }
    this.hospitalU = {
        idCentroHospitalario: 1,
        nombre: '',
        pais: '',
        region: '',
        capacidad: 1,
        capacidadUci: 1,
        director: '',
        contacto: ''
    };

  }

  generateForm(updateForm?: NgForm) {
    if (updateForm != null) {
      updateForm.reset();
    }
    this.hospitall = {
        nombre: '',
        pais: '',
        region: '',
        capacidad: 1,
        capacidadUci: 1,
        director: '',
        contacto: ''
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

  onSubmit(hospitalForm: NgForm) {
    console.log('Ingresado');
    console.log(this.service.postCentroHospitalarios(this.hospitall));
    this.service.postCentroHospitalarios(this.hospitall);
    this.service.getCentroHospitalarios();
    this.generateFormU();
    this.generateForm();
  }


  onUpdate(updateForm: NgForm) {
    console.log('Actualizado');
    console.log(this.hospitalU);
    this.service.putCentroHospitalarios(this.hospitalU);
    this.service.getCentroHospitalarios();
    this.generateFormU();
    this.generateForm();
  }

  onDelete(idCentroHospitalario: number) {
    console.log('Deleted');
    this.service.deleteCentroHospitalarios(idCentroHospitalario);
    this.service.getCentroHospitalarios();
    this.generateFormU();
    this.generateForm();
   }

  selectId(hospital: CentroHospitalario) {
    this.hospitalU = hospital;
    console.log(this.hospitalU);
    console.log(this.hospitalU.idCentroHospitalario);
  }

}
