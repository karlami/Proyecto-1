package com.example.cotecapp.Entidades;

import java.io.Serializable;
/**
 * Clase que modela la entidad Hospital de la base de datos SQLite
 */
public class Hospital implements Serializable {
    /**
     * Atributos de la entidad Hospital
     */
    private Integer idCentroHospitalario;
    private String nombre;
    private Integer capacidad;
    private Integer capacidadUci;
    private String contacto;
    private String director;
    private String idUbicacion;
    public Hospital(){

    }
    public Hospital(Integer idCentroHospitalario, String nombre, Integer capacidad, Integer capacidadUci, String contacto, String director, String idUbicacion) {
        this.idCentroHospitalario = idCentroHospitalario;
        this.nombre = nombre;
        this.capacidad = capacidad;
        this.capacidadUci = capacidadUci;
        this.contacto = contacto;
        this.director = director;
        this.idUbicacion = idUbicacion;
    }

    public Integer getIdCentroHospitalario() {
        return idCentroHospitalario;
    }

    public void setIdCentroHospitalario(Integer idCentroHospitalario) {
        this.idCentroHospitalario = idCentroHospitalario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(Integer capacidad) {
        this.capacidad = capacidad;
    }

    public Integer getCapacidadUci() {
        return capacidadUci;
    }

    public void setCapacidadUci(Integer capacidadUci) {
        this.capacidadUci = capacidadUci;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getIdUbicacion() {
        return idUbicacion;
    }

    public void setIdUbicacion(String idUbicacion) {
        this.idUbicacion = idUbicacion;
    }
}
