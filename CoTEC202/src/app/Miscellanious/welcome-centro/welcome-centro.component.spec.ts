import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { WelcomeCentroComponent } from './welcome-centro.component';

describe('WelcomeCentroComponent', () => {
  let component: WelcomeCentroComponent;
  let fixture: ComponentFixture<WelcomeCentroComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ WelcomeCentroComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(WelcomeCentroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
