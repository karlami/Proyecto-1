import { Component, OnInit } from '@angular/core';
import { CentroHospitalario } from 'src/app/Modelos/centro-hospitalario.model';
import { CentroHospitalarioManagementService } from 'src/app/Servicios/centro-hospitalario-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';


@Component({
  selector: 'app-gestion-centros-hospitalarios',
  templateUrl: './gestion-centros-hospitalarios.component.html',
  styleUrls: ['./gestion-centros-hospitalarios.component.css']
})
export class GestionCentrosHospitalariosComponent implements OnInit {
  hospitalList: CentroHospitalario[];
  hospitalForm: NgForm;
  updateForm: NgForm;
  submitted = false;
  hospitall: CentroHospitalario;
  hospitalU: CentroHospitalario;

  constructor(public service: CentroHospitalarioManagementService, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    // this.service.getPaquetes();
    this.generateForm();
  }

  generateForm(hospitalForm?: NgForm) {
    if (hospitalForm != null) {
      hospitalForm.reset();
    }
    this.hospitall = {
        idCentroHospitalario: 1,
        nombre: '',
        pais: '',
        region: '',
        capacidad: 1,
        capacidadUCI: 1,
        director: '',
        contacto: ''
    };

  }

  onSubmit(hospitalForm: NgForm) {
    console.log('Ingresado');
    // this.service.postPaquetes(this.paquetee);
    this.generateForm();
  }

}




/*
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
