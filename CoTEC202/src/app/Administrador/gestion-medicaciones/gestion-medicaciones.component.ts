import { Component, OnInit } from '@angular/core';
import { Medicamento } from 'src/app/Modelos/medicamento.model';
import { MedicamentoManagementService } from 'src/app/Servicios/medicamento-management.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { NgForm } from '@angular/forms';

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
  medicamentoo: Medicamento;
  medicamentoU: Medicamento;

  constructor(public service: MedicamentoManagementService, private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    // this.service.getPaquetes();
    this.generateForm();
  }

  generateForm(medicamentoForm?: NgForm) {
    if (medicamentoForm != null) {
      medicamentoForm.reset();
    }
    this.medicamentoo = {
        idMedicamento: 1,
        nombre: '',
        descripcion: '',
        casaFarmaceutica: ''
    };

  }

  onSubmit(medicamentoForm: NgForm) {
    console.log('Ingresado');
    // this.service.postPaquetes(this.paquetee);
    this.generateForm();
  }

}
