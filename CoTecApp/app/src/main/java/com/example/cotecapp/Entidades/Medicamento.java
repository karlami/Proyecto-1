package com.example.cotecapp.Entidades;

import java.io.Serializable;
/**
 * Clase que modela la entidad Medicamento de la base de datos SQLite
 */
public class Medicamento implements Serializable{
    /**
     * Atributos de la entidad Medicamento
     */
    private Integer idMedicamento;
    private String nombre;
    private String descripcion;
    private String casaFarmaceutica;

    public Medicamento(){

    }

    public Medicamento(Integer idMedicamento, String nombre, String descripcion, String casaFarmaceutica) {
        this.idMedicamento = idMedicamento;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.casaFarmaceutica = casaFarmaceutica;
    }

    public Integer getIdMedicamento() {
        return idMedicamento;
    }

    public void setIdMedicamento(Integer idMedicamento) {
        this.idMedicamento = idMedicamento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCasaFarmaceutica() {
        return casaFarmaceutica;
    }

    public void setCasaFarmaceutica(String casaFarmaceutica) {
        this.casaFarmaceutica = casaFarmaceutica;
    }
}
