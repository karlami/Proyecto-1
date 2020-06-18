import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { GoogleMapsAPIWrapper, MapsAPILoader, AgmMap, MouseEvent } from '@agm/core';
import { ViewChild, ElementRef, NgZone, } from '@angular/core';
import { Observable } from 'rxjs';


declare let google: any;

interface Location {
  lat: number; 
  lng: number;
}


@Component({
  selector: 'app-acumulado-casos-confirmados',
  templateUrl: './acumulado-casos-confirmados.component.html',
  styleUrls: ['./acumulado-casos-confirmados.component.css']
})
export class AcumuladoCasosConfirmadosComponent implements OnInit {

  address = 'Steinsel, Luxembourg, Europe';
  location: Location;
  loading: boolean;

  locationChosen = false;
  public latitude: number;
  public longitude: number;
  public lat: number;
  public lng: number;

  geocoder:any;
  zoom: 5
  drag: boolean;
  pais: string;

  labelOptions = {
    color: '#33FFC1',
    fontFamily: '',
    fontSize: '14px',
    fontWeight: 'bold',
    text: '.',
    }
 
  @ViewChild(AgmMap) map: AgmMap;

  constructor(public mapsApiLoader: MapsAPILoader,
              private zone: NgZone,
              private wrapper: GoogleMapsAPIWrapper,
              private ref: ChangeDetectorRef) {
    this.mapsApiLoader = mapsApiLoader;
    this.zone = zone;
    this.wrapper = wrapper;
    this.mapsApiLoader.load().then(() => {
      this.geocoder = new google.maps.Geocoder();
  });
}

getLocation(): Observable<any> {
  console.log('Getting address: ', this.address);
  let geocoder = new google.maps.Geocoder();
  console.log(1)
  return Observable.create(observer => {
      geocoder.geocode({
          'address': this.address
      }, (results, status) => {
        console.log(2)
          if (status == google.maps.GeocoderStatus.OK) {
            console.log(3)
              observer.next(results[0].geometry.location);
              console.log(4)
              console.log(results.latitude)
              console.log(results.longitude)
              observer.complete();
          } else {
              console.log('Error: ', results, ' & Status: ', status);
              observer.error();
          }
      });
  });
}

updateMapPosition(){
  var geocoder = new google.maps.Geocoder(); //crashes here !!
  console.log(1)
  geocoder.geocode({'address': this.address}, (results, status) => {
    console.log(2)
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[0] != null) {
          console.log(3)
          this.lat = results[0].geometry.location.lat();
          this.lng = results[0].geometry.location.lng();
            console.log(5)
              }
              else{
                  alert("hop")
              }
          }
      }
  )
}

public setCurrentPosition() {
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(
      position => {
        this.latitude = position.coords.latitude; // Works fine
        this.longitude = position.coords.longitude;  // Works fine

        let geocoder = new google.maps.Geocoder();
        let latlng = new google.maps.LatLng(this.latitude, this.longitude);
        let request = {
          latLng: latlng
        };

        geocoder.geocode(request, (results, status) => {
          if (status == google.maps.GeocoderStatus.OK) {
            if (results[0] != null) {
              for (var i = 0; i < results[0].address_components.length; i++) {
                let types = results[0].address_components[i].types

                if (types.indexOf('country') != -1) {
                  this.pais = results[0].address_components[i].long_name
                }
              }
              console.log(this.pais);
            } else {
              alert("No address available");
            }
          }
        });
      });
  }
}

markerDragEnd( event: any) {
  this.latitude = event.coords.lat;
  this.longitude = event.coords.lng;
  this.findAddressByCoordinates();
 }

 findAddressByCoordinates() {
   let latlng = new google.maps.LatLng(this.latitude, this.longitude);
   let request = {
     latLng: latlng
   };  
   this.geocoder.geocode(request, (results) => {
    this.decomposeAddressComponents(results);
  })
}

decomposeAddressComponents(addressArray) {
  if (addressArray.length == 0) return false;
  let address = addressArray[0].address_components;

  for(let element of address) {
    if (element.length == 0 && !element['types']) continue

    if (element['types'].indexOf('country') > -1) {
      this.pais = element['long_name'];
      console.log(this.pais);
    }
  }
}

  ngOnInit(): void {
    this.drag = true;
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
