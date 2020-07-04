import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filterAcumulado'
})
export class FilterAcumuladoPipe implements PipeTransform {

  transform(value: unknown, ...args: unknown[]): unknown {
    return null;
  }

}
