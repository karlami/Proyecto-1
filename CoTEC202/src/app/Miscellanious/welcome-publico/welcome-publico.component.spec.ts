import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { WelcomePublicoComponent } from './welcome-publico.component';

describe('WelcomePublicoComponent', () => {
  let component: WelcomePublicoComponent;
  let fixture: ComponentFixture<WelcomePublicoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ WelcomePublicoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(WelcomePublicoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
