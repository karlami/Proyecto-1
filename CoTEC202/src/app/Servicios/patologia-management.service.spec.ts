import { TestBed } from '@angular/core/testing';

import { PatologiaManagementService } from './patologia-management.service';

describe('PatologiaManagementService', () => {
  let service: PatologiaManagementService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(PatologiaManagementService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
