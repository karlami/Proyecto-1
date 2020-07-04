package com.example.cotecapp.Entidades;

import java.io.Serializable;
/**
 * Clase que modela la entidad Estado de la base de datos SQLite
 */
public class Estado implements Serializable {
    /**
     * Atributos de la entidad Estado
     */
    private Integer idEstado;
    private String Estado;

    public Estado(){

    }

    public Estado(Integer idEstado, String estado) {
        this.idEstado = idEstado;
        Estado = estado;
    }

    public Integer getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(Integer idEstado) {
        this.idEstado = idEstado;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String estado) {
        Estado = estado;
    }
}
