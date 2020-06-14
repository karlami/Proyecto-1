import { TestBed } from '@angular/core/testing';

import { MedidasPaisManagementService } from './medidas-pais-management.service';

describe('MedidasPaisManagementService', () => {
  let service: MedidasPaisManagementService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MedidasPaisManagementService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
