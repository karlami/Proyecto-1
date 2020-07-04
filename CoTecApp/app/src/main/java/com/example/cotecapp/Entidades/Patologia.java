package com.example.cotecapp.Entidades;

import java.io.Serializable;
/**
 * Clase que modela la entidad Patologia de la base de datos SQLite
 */
public class Patologia implements Serializable {
    /**
     * Atributos de la entidad Patologia
     */
    private Integer idPatologia;
    private String Nombre;
    private String descripcion;
    private String sintomas;
    private String tratamiento;

    public Patologia(){

    }

    public Patologia(Integer idPatologia, String nombre, String descripcion, String sintomas, String tratamiento) {
        this.idPatologia = idPatologia;
        Nombre = nombre;
        this.descripcion = descripcion;
        this.sintomas = sintomas;
        this.tratamiento = tratamiento;
    }

    public Integer getIdPatologia() {
        return idPatologia;
    }

    public void setIdPatologia(Integer idPatologia) {
        this.idPatologia = idPatologia;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getSintomas() {
        return sintomas;
    }

    public void setSintomas(String sintomas) {
        this.sintomas = sintomas;
    }

    public String getTratamiento() {
        return tratamiento;
    }

    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }
}
