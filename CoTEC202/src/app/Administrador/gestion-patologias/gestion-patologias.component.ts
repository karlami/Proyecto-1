import { Component, OnInit } from '@angular/core';
import { Patologia } from 'src/app/Modelos/patologia.model';
import { Patologiap } from 'src/app/Modelos/patologiap.model';
import { PatologiaManagementService } from 'src/app/Servicios/patologia-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-gestion-patologias',
  templateUrl: './gestion-patologias.component.html',
  styleUrls: ['./gestion-patologias.component.css']
})
export class GestionPatologiasComponent implements OnInit {
  patologiaList: Patologia[];
  patologiaForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  patt: Patologiap;
  pattU: Patologia;
  closeResult = '';

  constructor(public service: PatologiaManagementService, private formBuilder: FormBuilder,
              private modalService: NgbModal) { }

  ngOnInit(): void {
    this.service.getPatologias();
    this.generateForm();
  }

  generateForm(patologiaForm?: NgForm) {
    if (patologiaForm != null) {
      patologiaForm.reset();
    }
    this.patt = {
        nombre: '',
        descripcion: '',
        sintomas: '',
        tratamiento: ''
    };

  }

  generateFormU(updateForm?: NgForm) {
    if (updateForm != null) {
      updateForm.reset();
    }
    this.pattU = {
        idPatologia: 1,
        nombre: '',
        descripcion: '',
        sintomas: '',
        tratamiento: ''
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

  onSubmit(patologiaForm: NgForm) {
    console.log('Ingresado');
    this.service.postPatologias(this.pattU);
    this.generateForm();
  }

  onUpdate(updateForm: NgForm) {
    console.log('Actualizado');
    console.log(this.pattU);
    this.service.putPatologias(this.pattU);
    this.service.getPatologias();
    this.generateForm();
    this.generateFormU();
  }

  onDelete(idPatologia: number) {
    console.log('Deleted');
    this.service.deletePatologias(idPatologia);
    this.service.getPatologias();
    this.generateForm();
    this.generateFormU();
   }

  selectId(patologia: Patologia) {
    this.pattU = patologia;
    console.log(this.pattU);
    console.log(this.pattU.idPatologia);
  }

}
