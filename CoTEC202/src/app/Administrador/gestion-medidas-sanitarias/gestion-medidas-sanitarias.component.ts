import { Component, OnInit } from '@angular/core';
import { MedidaSanitaria } from 'src/app/Modelos/medida-sanitaria.model';
import { Medidasanitariap } from 'src/app/Modelos/medidasanitariap.model';
import { MedidaSanitariaManagementService } from 'src/app/Servicios/medida-sanitaria-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-gestion-medidas-sanitarias',
  templateUrl: './gestion-medidas-sanitarias.component.html',
  styleUrls: ['./gestion-medidas-sanitarias.component.css']
})
export class GestionMedidasSanitariasComponent implements OnInit {

  medidaList: MedidaSanitaria[];
  medidaForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  medidaa: Medidasanitariap;
  medidaU: MedidaSanitaria;
  closeResult = '';

  constructor(public service: MedidaSanitariaManagementService, private formBuilder: FormBuilder,
              private modalService: NgbModal) { }

  ngOnInit(): void {
    this.service.getMedida();
    this.generateForm();
    this.generateFormU();
  }

  generateFormU(updateForm?: NgForm) {
    if (updateForm != null) {
      updateForm.reset();
    }
    this.medidaU = {
        idMedidaSanitaria: 1,
        nombre: '',
        descripcion: ''
    };

  }

  generateForm(medidaForm?: NgForm) {
    if (medidaForm != null) {
      medidaForm.reset();
    }
    this.medidaa = {
        nombre: '',
        descripcion: ''
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
    this.service.postMedida(this.medidaa);
    this.service.getMedida();
    this.generateForm();
    this.generateFormU();
  }

  onUpdate(updateForm: NgForm) {
    console.log('Actualizado');
    console.log(this.medidaU);
    this.service.putMedida(this.medidaU);
    this.service.getMedida();
    this.generateForm();
    this.generateFormU();
  }

  onDelete(idMedidaSanitaria: number) {
    console.log('Deleted');
    this.service.deleteMedida(idMedidaSanitaria);
    this.service.getMedida();
    this.generateForm();
    this.generateFormU();
   }

  selectId(medidaSanitaria: MedidaSanitaria) {
    this.medidaU = medidaSanitaria;
    console.log(this.medidaU);
    console.log(this.medidaU.idMedidaSanitaria);
  }

}
