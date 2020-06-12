import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AcumuladoCasosConfirmadosComponent } from './acumulado-casos-confirmados.component';

describe('AcumuladoCasosConfirmadosComponent', () => {
  let component: AcumuladoCasosConfirmadosComponent;
  let fixture: ComponentFixture<AcumuladoCasosConfirmadosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AcumuladoCasosConfirmadosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AcumuladoCasosConfirmadosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
