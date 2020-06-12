import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GestionContactosPacienteComponent } from './gestion-contactos-paciente.component';

describe('GestionContactosPacienteComponent', () => {
  let component: GestionContactosPacienteComponent;
  let fixture: ComponentFixture<GestionContactosPacienteComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GestionContactosPacienteComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GestionContactosPacienteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
