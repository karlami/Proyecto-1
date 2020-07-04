import { TestBed } from '@angular/core/testing';

import { MedidaContencionManagementService } from './medida-contencion-management.service';

describe('MedidaContencionManagementService', () => {
  let service: MedidaContencionManagementService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MedidaContencionManagementService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
