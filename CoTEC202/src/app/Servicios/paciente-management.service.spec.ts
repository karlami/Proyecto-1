import { TestBed } from '@angular/core/testing';

import { PacienteManagementService } from './paciente-management.service';

describe('PacienteManagementService', () => {
  let service: PacienteManagementService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(PacienteManagementService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
