import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MedidasContencionTomadasComponent } from './medidas-contencion-tomadas.component';

describe('MedidasContencionTomadasComponent', () => {
  let component: MedidasContencionTomadasComponent;
  let fixture: ComponentFixture<MedidasContencionTomadasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MedidasContencionTomadasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MedidasContencionTomadasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
