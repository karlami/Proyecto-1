import { TestBed } from '@angular/core/testing';

import { EstadoPacienteManagementService } from './estado-paciente-management.service';

describe('EstadoPacienteManagementService', () => {
  let service: EstadoPacienteManagementService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(EstadoPacienteManagementService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
