package com.example.cotecapp.Entidades;

import java.io.Serializable;

public class Contacto implements Serializable {
    private Integer idContacto;
    private String correo;
    private Integer idPaciente;
    private String cedula;

    public Contacto(Integer idContacto, String correo, Integer idPaciente, String cedula) {
        this.idContacto = idContacto;
        this.correo = correo;
        this.idPaciente = idPaciente;
        this.cedula = cedula;
    }

    public Integer getIdContacto() {
        return idContacto;
    }

    public void setIdContacto(Integer idContacto) {
        this.idContacto = idContacto;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Integer getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Integer idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }
}
