import { Component, OnInit } from '@angular/core';
import { Patologia } from 'src/app/Modelos/patologia.model';
import { PatologiaManagementService } from 'src/app/Servicios/patologia-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';

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
  patt: Patologia;
  pattU: Patologia;

  constructor(public service: PatologiaManagementService, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    // this.service.getPaquetes();
    this.generateForm();
  }

  generateForm(patologiaForm?: NgForm) {
    if (patologiaForm != null) {
      patologiaForm.reset();
    }
    this.patt = {
        idPatologia: 1,
        nombre: '',
        descripcion: '',
        sintomas: '',
        tratamiento: ''
    };

  }

  onSubmit(patologiaForm: NgForm) {
    console.log('Ingresado');
    // this.service.postPaquetes(this.paquetee);
    this.generateForm();
  }

}
