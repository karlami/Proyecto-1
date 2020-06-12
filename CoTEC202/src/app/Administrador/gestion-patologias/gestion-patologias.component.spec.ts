import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GestionPatologiasComponent } from './gestion-patologias.component';

describe('GestionPatologiasComponent', () => {
  let component: GestionPatologiasComponent;
  let fixture: ComponentFixture<GestionPatologiasComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GestionPatologiasComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GestionPatologiasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
