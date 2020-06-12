import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ReporteNuevosCasosMuertesComponent } from './reporte-nuevos-casos-muertes.component';

describe('ReporteNuevosCasosMuertesComponent', () => {
  let component: ReporteNuevosCasosMuertesComponent;
  let fixture: ComponentFixture<ReporteNuevosCasosMuertesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ReporteNuevosCasosMuertesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ReporteNuevosCasosMuertesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
