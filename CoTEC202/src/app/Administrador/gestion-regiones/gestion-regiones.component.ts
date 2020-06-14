import { Component, OnInit } from '@angular/core';
import { Ubicacion } from 'src/app/Modelos/ubicacion.model';
import { UbicacionManagementService } from 'src/app/Servicios/ubicacion-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';

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
  ubicacionn: Ubicacion;
  ubicacionU: Ubicacion;

  constructor(public service: UbicacionManagementService, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    // this.service.getPaquetes();
    this.generateForm();
  }

  generateForm(ubicacionForm?: NgForm) {
    if (ubicacionForm != null) {
      ubicacionForm.reset();
    }
    this.ubicacionn = {
        idUbicacion: 1,
        pais: '',
        region: '',
        continente: ''
    };

  }

  onSubmit(ubicacionForm: NgForm) {
    console.log('Ingresado');
    // this.service.postPaquetes(this.paquetee);
    this.generateForm();
  }

}
