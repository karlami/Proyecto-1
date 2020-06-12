import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GestionRegionesComponent } from './gestion-regiones.component';

describe('GestionRegionesComponent', () => {
  let component: GestionRegionesComponent;
  let fixture: ComponentFixture<GestionRegionesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GestionRegionesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GestionRegionesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
