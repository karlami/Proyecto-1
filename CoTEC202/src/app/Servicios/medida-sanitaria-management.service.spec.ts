import { TestBed } from '@angular/core/testing';

import { MedidaSanitariaManagementService } from './medida-sanitaria-management.service';

describe('MedidaSanitariaManagementService', () => {
  let service: MedidaSanitariaManagementService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MedidaSanitariaManagementService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
