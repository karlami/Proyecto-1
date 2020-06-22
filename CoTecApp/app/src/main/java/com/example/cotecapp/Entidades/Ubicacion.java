package com.example.cotecapp.Entidades;

import java.io.Serializable;

public class Ubicacion implements Serializable {
    private Integer id;
    private String Continente;
    private String Pais;
    private String Region;

    public Ubicacion(){

    }
    public Ubicacion(Integer id, String continente, String pais, String region) {
        this.id = id;
        Continente = continente;
        Pais = pais;
        Region = region;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContinente() {
        return Continente;
    }

    public void setContinente(String continente) {
        Continente = continente;
    }

    public String getPais() {
        return Pais;
    }

    public void setPais(String pais) {
        Pais = pais;
    }

    public String getRegion() {
        return Region;
    }

    public void setRegion(String region) {
        Region = region;
    }
}
