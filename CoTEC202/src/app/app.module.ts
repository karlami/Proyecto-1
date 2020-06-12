import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AcumuladoCasosConfirmadosComponent } from './PublicoGeneral/acumulado-casos-confirmados/acumulado-casos-confirmados.component';
import { MedidasContencionTomadasComponent } from './PublicoGeneral/medidas-contencion-tomadas/medidas-contencion-tomadas.component';
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
import { RegistrarseComponent } from './Login/registrarse/registrarse.component';
import { IngresarComponent } from './Login/ingresar/ingresar.component';
import { NavBarPublicoComponent } from './Miscellanious/nav-bar-publico/nav-bar-publico.component';
import { WelcomePublicoComponent } from './Miscellanious/welcome-publico/welcome-publico.component';
import { NavBarAdministradorComponent } from './Miscellanious/nav-bar-administrador/nav-bar-administrador.component';
import { NavBarCentroComponent } from './Miscellanious/nav-bar-centro/nav-bar-centro.component';
import { NavBarLoginComponent } from './Miscellanious/nav-bar-login/nav-bar-login.component';
import { WelcomeAdministradorComponent } from './Miscellanious/welcome-administrador/welcome-administrador.component';
import { WelcomeCentroComponent } from './Miscellanious/welcome-centro/welcome-centro.component';
import { WelcomeLoginComponent } from './Miscellanious/welcome-login/welcome-login.component';

@NgModule({
  declarations: [
    AppComponent,
    AcumuladoCasosConfirmadosComponent,
    MedidasContencionTomadasComponent,
    GestionRegionesComponent,
    GestionPatologiasComponent,
    GestionEstadoPacientesComponent,
    GestionCentrosHospitalariosComponent,
    GestionMedidasSanitariasComponent,
    GestionMedidasSanitariasPaisComponent,
    GestionMedicacionesComponent,
    GestionPacientesComponent,
    GestionContactosPacienteComponent,
    ReportesComponent,
    ReportePacienteEstadoComponent,
    ReporteNuevosCasosMuertesComponent,
    RegistrarseComponent,
    IngresarComponent,
    NavBarPublicoComponent,
    WelcomePublicoComponent,
    NavBarAdministradorComponent,
    NavBarCentroComponent,
    NavBarLoginComponent,
    WelcomeAdministradorComponent,
    WelcomeCentroComponent,
    WelcomeLoginComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
