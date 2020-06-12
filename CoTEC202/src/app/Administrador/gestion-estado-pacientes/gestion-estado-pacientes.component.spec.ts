import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GestionEstadoPacientesComponent } from './gestion-estado-pacientes.component';

describe('GestionEstadoPacientesComponent', () => {
  let component: GestionEstadoPacientesComponent;
  let fixture: ComponentFixture<GestionEstadoPacientesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GestionEstadoPacientesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GestionEstadoPacientesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
