import { TestBed } from '@angular/core/testing';

import { ContactoManagementService } from './contacto-management.service';

describe('ContactoManagementService', () => {
  let service: ContactoManagementService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ContactoManagementService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
