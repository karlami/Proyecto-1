import { Component, OnInit } from '@angular/core';
import { MedidaContencion } from 'src/app/Modelos/medida-contencion.model';
import { MedidaContencionManagementService } from 'src/app/Servicios/medida-contencion-management.service';

@Component({
  selector: 'app-medidas-contencion-tomadas',
  templateUrl: './medidas-contencion-tomadas.component.html',
  styleUrls: ['./medidas-contencion-tomadas.component.css']
})
export class MedidasContencionTomadasComponent implements OnInit {

  constructor(public service: MedidaContencionManagementService) { }

  ngOnInit(): void {
    this.service.getMedida();
  }

}
