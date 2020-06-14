import { Component, OnInit } from '@angular/core';
import { MedidasPais } from 'src/app/Modelos/medidas-pais.model';
import { MedidasPaisManagementService } from 'src/app/Servicios/medidas-pais-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';

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
  medidap: MedidasPais;
  medidapU: MedidasPais;

  constructor(public service: MedidasPaisManagementService, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    // this.service.getPaquetes();
    this.generateForm();
  }

  generateForm(medidapForm?: NgForm) {
    if (medidapForm != null) {
      medidapForm.reset();
    }
    this.medidap = {
        pais: '',
        medidas: '',
        estado: '',
        fechaInicio: new Date('Jan 01 2020'),
        fechaFinal: new Date('Jan 01 2020')
    };

  }

  onSubmit(medidapForm: NgForm) {
    console.log('Ingresado');
    // this.service.postPaquetes(this.paquetee);
    this.generateForm();
  }

}
