import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportePacienteEstadoComponent } from './reporte-paciente-estado.component';

describe('ReportePacienteEstadoComponent', () => {
  let component: ReportePacienteEstadoComponent;
  let fixture: ComponentFixture<ReportePacienteEstadoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReportePacienteEstadoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReportePacienteEstadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
