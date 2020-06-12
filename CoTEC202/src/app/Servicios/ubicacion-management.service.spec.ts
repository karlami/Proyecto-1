import { TestBed } from '@angular/core/testing';

import { UbicacionManagementService } from './ubicacion-management.service';

describe('UbicacionManagementService', () => {
  let service: UbicacionManagementService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(UbicacionManagementService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
