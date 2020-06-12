import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { WelcomeAdministradorComponent } from './welcome-administrador.component';

describe('WelcomeAdministradorComponent', () => {
  let component: WelcomeAdministradorComponent;
  let fixture: ComponentFixture<WelcomeAdministradorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ WelcomeAdministradorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(WelcomeAdministradorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
