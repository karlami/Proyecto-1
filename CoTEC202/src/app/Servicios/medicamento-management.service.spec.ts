import { TestBed } from '@angular/core/testing';

import { MedicamentoManagementService } from './medicamento-management.service';

describe('MedicamentoManagementService', () => {
  let service: MedicamentoManagementService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MedicamentoManagementService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
