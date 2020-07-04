import { Component, OnInit } from '@angular/core';
import { MedidasPais } from 'src/app/Modelos/medidas-pais.model';
import { Medidapaisp } from 'src/app/Modelos/medidapaisp.model';
import { MedidaSanitaria } from 'src/app/Modelos/medida-sanitaria.model';
import { MedidasPaisManagementService } from 'src/app/Servicios/medidas-pais-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';
import { MedidaSanitariaManagementService } from 'src/app/Servicios/medida-sanitaria-management.service';

@Component({
  selector: 'app-gestion-medidas-sanitarias-pais',
  templateUrl: './gestion-medidas-sanitarias-pais.component.html',
  styleUrls: ['./gestion-medidas-sanitarias-pais.component.css']
})
export class GestionMedidasSanitariasPaisComponent implements OnInit {

  medidapList: MedidasPais[];
  medidapForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  medidap: Medidapaisp;
  medidapU: MedidasPais;
  closeResult = '';
  sanitariaList: MedidaSanitaria[];
  medidaU: MedidaSanitaria;

  constructor(public service: MedidasPaisManagementService, private formBuilder: FormBuilder,
              private modalService: NgbModal, public servicem: MedidaSanitariaManagementService) { }

  ngOnInit(): void {
    this.service.getMedida();
    this.servicem.getMedida();
    this.generateForm();
  }


  generateForm(medidapForm?: NgForm) {
    if (medidapForm != null) {
      medidapForm.reset();
    }
    this.medidap = {
        pais: '',
        medidas: this.servicem.getMedida,
        estado: '',
        fechaInicio: new Date('Jan 01 2020'),
        fechaFinal: new Date('Jan 01 2020')
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


  onSubmit(medidaForm: NgForm) {
    console.log('Ingresado');
    this.service.postMedida(this.medidap);
    this.service.getMedida();
    this.generateForm();
  }

  selectId(medidaSanitaria: MedidaSanitaria) {
    this.medidaU = medidaSanitaria;
    console.log(this.medidaU);
    console.log(this.medidaU.idMedidaSanitaria);
  }
}
