package com.example.cotecapp.Entidades;

import java.io.Serializable;
/**
 * Clase que modela la entidad Persona de la base de datos SQLite
 */
public class Persona implements Serializable {
    /**
     * Atributos de la entidad Persona
     */
    private String cedula;
    private String nombre;
    private String primerApellido;
    private String segundoApellido;
    private String nacionalidad;
    private String fechaNacimiento;
    private Integer idUbicacion;
    public Persona(){

    }
    public Persona(String cedula, String nombre, String primerApellido, String segundoApellido, String nacionalidad, String fechaNacimiento, Integer idUbicacion) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.nacionalidad = nacionalidad;
        this.fechaNacimiento = fechaNacimiento;
        this.idUbicacion = idUbicacion;
    }


    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Integer getIdUbicacion() {
        return idUbicacion;
    }

    public void setIdUbicacion(Integer idUbicacion) {
        this.idUbicacion = idUbicacion;
    }
}
