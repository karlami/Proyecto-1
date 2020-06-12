import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GestionMedidasSanitariasPaisComponent } from './gestion-medidas-sanitarias-pais.component';

describe('GestionMedidasSanitariasPaisComponent', () => {
  let component: GestionMedidasSanitariasPaisComponent;
  let fixture: ComponentFixture<GestionMedidasSanitariasPaisComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GestionMedidasSanitariasPaisComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GestionMedidasSanitariasPaisComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
