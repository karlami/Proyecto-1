import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NavBarCentroComponent } from './nav-bar-centro.component';

describe('NavBarCentroComponent', () => {
  let component: NavBarCentroComponent;
  let fixture: ComponentFixture<NavBarCentroComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NavBarCentroComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NavBarCentroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
