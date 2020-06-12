import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GestionMedicacionesComponent } from './gestion-medicaciones.component';

describe('GestionMedicacionesComponent', () => {
  let component: GestionMedicacionesComponent;
  let fixture: ComponentFixture<GestionMedicacionesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GestionMedicacionesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GestionMedicacionesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
