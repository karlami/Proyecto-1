import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GestionCentrosHospitalariosComponent } from './gestion-centros-hospitalarios.component';

describe('GestionCentrosHospitalariosComponent', () => {
  let component: GestionCentrosHospitalariosComponent;
  let fixture: ComponentFixture<GestionCentrosHospitalariosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GestionCentrosHospitalariosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GestionCentrosHospitalariosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
