import { Component, OnInit } from '@angular/core';
import { MouseEvent, MapsAPILoader } from '@agm/core';
import { ViewChild, ElementRef, NgZone, } from '@angular/core';

@Component({
  selector: 'app-acumulado-casos-confirmados',
  templateUrl: './acumulado-casos-confirmados.component.html',
  styleUrls: ['./acumulado-casos-confirmados.component.css']
})
export class AcumuladoCasosConfirmadosComponent implements OnInit {

  latitude: number;
  longitude: number;
  locationChosen = false;
  public fillInAddress: '';
  public f_addr: string;
  public provincia: string;
  public canton: string;
  public distrito: string;
  public postCode: string;
  public calle: string;
  public state: string;

  constructor(public mapsAPILoader: MapsAPILoader, public ngZone: NgZone) { }

  onChoseLocation(event) {
    this.latitude = event.coords.lat;
    this.longitude = event.coords.lng;
    this.locationChosen = true;
    console.log('latitude :' + this.latitude);
    console.log('longitude :' + this.longitude);
  }

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
