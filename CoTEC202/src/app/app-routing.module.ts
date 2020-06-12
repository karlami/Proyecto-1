import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { NavBarPublicoComponent } from './Miscellanious/nav-bar-publico/nav-bar-publico.component';
import { MedidasContencionTomadasComponent } from './PublicoGeneral/medidas-contencion-tomadas/medidas-contencion-tomadas.component';
import { AcumuladoCasosConfirmadosComponent } from './PublicoGeneral/acumulado-casos-confirmados/acumulado-casos-confirmados.component';
import { GestionRegionesComponent } from './Administrador/gestion-regiones/gestion-regiones.component';
import { GestionPatologiasComponent } from './Administrador/gestion-patologias/gestion-patologias.component';
import { GestionEstadoPacientesComponent } from './Administrador/gestion-estado-pacientes/gestion-estado-pacientes.component';
// tslint:disable-next-line: max-line-length
import { GestionCentrosHospitalariosComponent } from './Administrador/gestion-centros-hospitalarios/gestion-centros-hospitalarios.component';
import { GestionMedidasSanitariasComponent } from './Administrador/gestion-medidas-sanitarias/gestion-medidas-sanitarias.component';
import { GestionMedidasSanitariasPaisComponent } from './Administrador/gestion-medidas-sanitarias-pais/gestion-medidas-sanitarias-pais.component';
import { GestionMedicacionesComponent } from './Administrador/gestion-medicaciones/gestion-medicaciones.component';
import { GestionPacientesComponent } from './CentroHospitalario/gestion-pacientes/gestion-pacientes.component';
import { GestionContactosPacienteComponent } from './CentroHospitalario/gestion-contactos-paciente/gestion-contactos-paciente.component';
import { ReportesComponent } from './CentroHospitalario/reportes/reportes.component';
import { ReportePacienteEstadoComponent } from './CentroHospitalario/reportes/reporte-paciente-estado/reporte-paciente-estado.component';
import { ReporteNuevosCasosMuertesComponent } from './CentroHospitalario/reportes/reporte-nuevos-casos-muertes/reporte-nuevos-casos-muertes.component';
import { WelcomePublicoComponent } from './Miscellanious/welcome-publico/welcome-publico.component';
import { WelcomeLoginComponent } from './Miscellanious/welcome-login/welcome-login.component';
import { WelcomeCentroComponent } from './Miscellanious/welcome-centro/welcome-centro.component';
import { WelcomeAdministradorComponent } from './Miscellanious/welcome-administrador/welcome-administrador.component';
import { IngresarComponent } from './Login/ingresar/ingresar.component';
import { RegistrarseComponent } from './Login/registrarse/registrarse.component';


const routes: Routes = [
  { path: 'PublicoGeneral', pathMatch: 'prefix',
    children: [
      { path: 'Inicio', component: WelcomePublicoComponent},
      { path: 'AcumuladoCasosConfirmados', component: AcumuladoCasosConfirmadosComponent},
      { path: 'MedidasContencionTomadas', component: MedidasContencionTomadasComponent},
      { path: '**', component: WelcomePublicoComponent}
    ]
},

{ path: 'Administrador', pathMatch: 'prefix',
    children: [
      { path: 'Inicio', component: WelcomeAdministradorComponent},
      { path: 'GestionRegiones', component: GestionRegionesComponent},
      { path: 'GestionPatologias', component: GestionPatologiasComponent},
      { path: 'GestionEstadoPacientes', component: GestionEstadoPacientesComponent},
      { path: 'GestionCentrosHospitalarios', component: GestionCentrosHospitalariosComponent},
      { path: 'GestionMedidasSanitarias', component: GestionMedidasSanitariasComponent},
      { path: 'GestionMedidasSanitariasPais', component: GestionMedidasSanitariasPaisComponent},
      { path: 'GestionMedicaciones', component: GestionMedicacionesComponent},
      { path: '**', component: WelcomeAdministradorComponent}
    ]
},

{ path: 'CentroHospitalario', pathMatch: 'prefix',
    children: [
      { path: 'Inicio', component: WelcomeCentroComponent},
      { path: 'GestionPacientes', component: GestionPacientesComponent},
      { path: 'GestionContactosPaciente', component: GestionContactosPacienteComponent},
      { path: 'Reportes', component: ReportesComponent},
      { path: 'Reportes/ReportePacienteEstado', component: ReportePacienteEstadoComponent},
      { path: 'Reportes/ReporteNuevosCasosMuertes', component: ReporteNuevosCasosMuertesComponent},
      { path: '**', component: WelcomeCentroComponent}
    ]
},

{ path: 'CoTEC2020', pathMatch: 'prefix',
    children: [
      { path: 'Login', component: WelcomeLoginComponent},
      { path: 'Ingresar', component: IngresarComponent},
      { path: 'Registrarse', component: RegistrarseComponent},
      { path: '**', component: WelcomeLoginComponent}
    ]
}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
