import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-acumulado-casos-confirmados',
  templateUrl: './acumulado-casos-confirmados.component.html',
  styleUrls: ['./acumulado-casos-confirmados.component.css']
})
export class AcumuladoCasosConfirmadosComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}



/////////////////////////////////
/*
import { Component, OnInit } from '@angular/core';
import { Paquete } from 'src/app/Models/paquete.model';
import { PaqueteManagementService } from 'src/app/Services/paquete-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';


@Component({
  selector: 'app-gestion-paquetes',
  templateUrl: './gestion-paquetes.component.html',
  styleUrls: ['./gestion-paquetes.component.css']

})
export class GestionPaquetesComponent implements OnInit {
  paqueteList: Paquete[];
  paqueteForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  paquetee: Paquete;
  paqueteU: Paquete;

  constructor(public service: PaqueteManagementService, private formBuilder: FormBuilder) { }

  ngOnInit() {
    this.service.getPaquetes();
    this.generateForm();
  }

  generateForm(paqueteForm?: NgForm) {
    if (paqueteForm != null) {
      paqueteForm.reset();
    }
    this.paquetee = {
        trackingId: '',
        idCliente: '',
        idProducto: '',
        descripcion: '',
        fechaEstimada: '',
        estado: ''
    };

  }

  onSubmit(paqueteForm: NgForm) {
    console.log('Ingresado');
    this.service.postPaquetes(this.paquetee);
    this.generateForm();
  }

  onDelete(trackingId: string) {
   console.log('Deleted');
   this.service.deletePaquetes(trackingId);
  }

  selectId(paquete: Paquete) {
    this.paqueteU = paquete;
    console.log(this.paqueteU);
    console.log(this.paquetee.trackingId);
  }
}
*/
