import { TestBed } from '@angular/core/testing';

import { CentroHospitalarioManagementService } from './centro-hospitalario-management.service';

describe('CentroHospitalarioManagementService', () => {
  let service: CentroHospitalarioManagementService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CentroHospitalarioManagementService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
