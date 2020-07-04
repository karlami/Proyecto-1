import { Component, OnInit } from '@angular/core';
import { Contacto } from 'src/app/Modelos/contacto.model';
import { Contactop } from 'src/app/Modelos/contactop.model';
import { ContactoManagementService } from 'src/app/Servicios/contacto-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';

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
  contactoo: Contactop;
  contactoU: Contacto;
  closeResult = '';

  constructor(public service: ContactoManagementService, private formBuilder: FormBuilder,
              private modalService: NgbModal) { }

  ngOnInit(): void {
    this.service.getContactos();
    this.generateForm();
  }

  generateForm(contactoForm?: NgForm) {
    if (contactoForm != null) {
      contactoForm.reset();
    }
    this.contactoo = {
        cedula: 1,
        fechaNacimiento: new Date('Ene 01 2020'),
        idUbicacion: 1,
        patologia: '',
        nacionalidad: '',
        nombre: '',
        primerApellido: '',
        segundoApellido: '',
        correo: '',
        idPaciente: 1
    };

  }


  generateFormU(updateForm?: NgForm) {
    if (updateForm != null) {
      updateForm.reset();
    }
    this.contactoU = {
        idContacto: 1,
        cedula: 1,
        fechaNacimiento: new Date('Ene 01 2020'),
        idUbicacion: 1,
        patologia: '',
        nacionalidad: '',
        nombre: '',
        primerApellido: '',
        segundoApellido: '',
        correo: '',
        idPaciente: 1
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

  onSubmit(contactoForm: NgForm) {
    console.log('Ingresado');
    this.service.postContactos(this.contactoo);
    this.generateForm();
  }

  onUpdate(updateForm: NgForm) {
    console.log('Actualizado');
    console.log(this.contactoU);
    this.service.putContactos(this.contactoU);
  }

  onDelete(idContacto: number) {
    console.log('Deleted');
    this.service.deleteContactos(idContacto);
   }

  selectId(contacto: Contacto) {
    this.contactoU = contacto;
    console.log(this.contactoU);
    console.log(this.contactoU.idContacto);
  }

}
