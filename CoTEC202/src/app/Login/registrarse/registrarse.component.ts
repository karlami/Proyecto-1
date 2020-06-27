import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/Modelos/user.model';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-registrarse',
  templateUrl: './registrarse.component.html',
  styleUrls: ['./registrarse.component.css']
})
export class RegistrarseComponent implements OnInit {
  user: User;
  emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";


  constructor() { }

  ngOnInit(): void {
    this.resetForm(); 
  }


  resetForm(form?: NgForm) {
    if (form != null)
      form.reset();
    this.user = {
      userName: '',
      password: '',
      correo: '',
      primerNombre: '',
      apellido: ''
    }
  }


}
