import { Component, OnInit } from '@angular/core';
import { MedidaSanitaria } from 'src/app/Modelos/medida-sanitaria.model';
import { MedidaSanitariaManagementService } from 'src/app/Servicios/medida-sanitaria-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';

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
  medidaa: MedidaSanitaria;
  medidaU: MedidaSanitaria;

  constructor(public service: MedidaSanitariaManagementService, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    // this.service.getPaquetes();
    this.generateForm();
  }

  generateForm(medidaForm?: NgForm) {
    if (medidaForm != null) {
      medidaForm.reset();
    }
    this.medidaa = {
        idMedidaSanitaria: 1,
        nombre: '',
        descripcion: ''
    };

  }

  onSubmit(medidaForm: NgForm) {
    console.log('Ingresado');
    // this.service.postPaquetes(this.paquetee);
    this.generateForm();
  }

}
