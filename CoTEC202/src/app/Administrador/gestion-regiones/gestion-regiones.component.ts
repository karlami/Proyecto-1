import { Component, OnInit } from '@angular/core';
import { Ubicacion } from 'src/app/Modelos/ubicacion.model';
import { Ubicacionp } from 'src/app/Modelos/ubicacionp.model';
import { UbicacionManagementService } from 'src/app/Servicios/ubicacion-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-gestion-regiones',
  templateUrl: './gestion-regiones.component.html',
  styleUrls: ['./gestion-regiones.component.css']
})
export class GestionRegionesComponent implements OnInit {
  ubicacionList: Ubicacion[];
  ubicacionForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  ubicacionn: Ubicacionp;
  ubicacionU: Ubicacion;
  closeResult = '';

  constructor(public service: UbicacionManagementService, private formBuilder: FormBuilder,
              private modalService: NgbModal) { }

  ngOnInit(): void {
    this.service.getUbicaciones();
    this.generateForm();
    this.generateFormU();
  }

  generateForm(ubicacionForm?: NgForm) {
    if (ubicacionForm != null) {
      ubicacionForm.reset();
    }
    this.ubicacionn = {
        continente: '',
        pais: '',
        region: ''
    };

  }

  generateFormU(updateForm?: NgForm) {
    if (updateForm != null) {
      updateForm.reset();
    }
    this.ubicacionU = {
      idUbicacion: 1,
      continente: '',
      pais: '',
      region: ''
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

  onSubmit(medicamentoForm: NgForm) {
    console.log('Ingresado');
    console.log(this.ubicacionn);
    this.service.postUbicaciones(this.ubicacionn);
    this.service.getUbicaciones();
    this.generateForm();
    this.generateFormU();
  }

  onUpdate(updateForm: NgForm) {
    console.log('Actualizado');
    console.log(this.ubicacionU);
    this.service.putUbicaciones(this.ubicacionU);
    this.service.getUbicaciones();
    this.generateForm();
    this.generateFormU();
  }

  onDelete(idUbicacion: number) {
    console.log('Deleted');
    this.service.deleteUbicaciones(idUbicacion);
    this.service.getUbicaciones();
    this.generateForm();
    this.generateFormU();
   }

  selectId(ubicacion: Ubicacion) {
    this.ubicacionU = ubicacion;
    console.log(this.ubicacionU);
    console.log(this.ubicacionU.idUbicacion);
  }

}
