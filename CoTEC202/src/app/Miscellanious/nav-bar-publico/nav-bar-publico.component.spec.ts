import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NavBarPublicoComponent } from './nav-bar-publico.component';

describe('NavBarPublicoComponent', () => {
  let component: NavBarPublicoComponent;
  let fixture: ComponentFixture<NavBarPublicoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NavBarPublicoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NavBarPublicoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
