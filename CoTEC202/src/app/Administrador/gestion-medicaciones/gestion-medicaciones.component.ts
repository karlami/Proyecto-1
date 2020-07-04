import { Component, OnInit } from '@angular/core';
import { Medicamento } from 'src/app/Modelos/medicamento.model';
import { Medicamentop } from 'src/app/Modelos/medicamentop.model';
import { MedicamentoManagementService } from 'src/app/Servicios/medicamento-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';
import {NgbModal, ModalDismissReasons} from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-gestion-medicaciones',
  templateUrl: './gestion-medicaciones.component.html',
  styleUrls: ['./gestion-medicaciones.component.css']
})
export class GestionMedicacionesComponent implements OnInit {
  medicamentoList: Medicamento[];
  medicamentoForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  medicamentoo: Medicamentop;
  medicamentoU: Medicamento;
  closeResult = '';

  constructor(public service: MedicamentoManagementService, private formBuilder: FormBuilder,
              private modalService: NgbModal) { }

  ngOnInit(): void {
    this.service.getMedicamentos();
    console.log(this.service.getMedicamentoId(1));
    this.generateForm();
    this.generateFormU();
  }

  generateForm(medicamentoForm?: NgForm) {
    if (medicamentoForm != null) {
      medicamentoForm.reset();
    }
    this.medicamentoo = {
        casaFarmaceutica: '',
        descripcion: '',
        nombre: ''
    };

  }


  generateFormU(updateForm?: NgForm) {
    if (updateForm != null) {
      updateForm.reset();
    }
    this.medicamentoU = {
        casaFarmaceutica: '',
        descripcion: '',
        idMedicamento: 1,
        nombre: ''
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
    console.log(this.medicamentoo);
    this.service.postMedicamento(this.medicamentoo);
    this.service.getMedicamentos();
    this.generateForm();
    this.generateFormU();
  }

  onUpdate(updateForm: NgForm) {
    console.log('Actualizado');
    console.log(this.medicamentoU);
    this.service.putMedicamentos(this.medicamentoU);
  }

  onDelete(idMedicamento: number) {
    console.log('Deleted');
    this.service.deleteMedicamentos(idMedicamento);
   }

  selectId(medicamento: Medicamento) {
    this.medicamentoU = medicamento;
    console.log(this.medicamentoU);
    console.log(this.medicamentoU.idMedicamento);
  }

}
