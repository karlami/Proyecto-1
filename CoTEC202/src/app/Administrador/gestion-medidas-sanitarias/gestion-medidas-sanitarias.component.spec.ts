import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GestionMedidasSanitariasComponent } from './gestion-medidas-sanitarias.component';

describe('GestionMedidasSanitariasComponent', () => {
  let component: GestionMedidasSanitariasComponent;
  let fixture: ComponentFixture<GestionMedidasSanitariasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GestionMedidasSanitariasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GestionMedidasSanitariasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
