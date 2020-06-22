package com.example.cotecapp.Entidades;

import java.io.Serializable;

public class Paciente implements Serializable {
    private Integer idPaciente;
    private Integer internado;
    private Integer uci;
    private String fechaIngreso;
    private Integer idCentroHospitalario;
    private String cedula;

    public Paciente(Integer idPaciente, Integer internado, Integer uci, String fechaIngreso, Integer idCentroHospitalario, String cedula) {
        this.idPaciente = idPaciente;
        this.internado = internado;
        this.uci = uci;
        this.fechaIngreso = fechaIngreso;
        this.idCentroHospitalario = idCentroHospitalario;
        this.cedula = cedula;

    }
    public Paciente(){};

    public Integer getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Integer idPaciente) {
        this.idPaciente = idPaciente;
    }

    public Integer getInternado() {
        return internado;
    }

    public void setInternado(Integer internado) {
        this.internado = internado;
    }

    public Integer getUci() {
        return uci;
    }

    public void setUci(Integer uci) {
        this.uci = uci;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public Integer getIdCentroHospitalario() {
        return idCentroHospitalario;
    }

    public void setIdCentroHospitalario(Integer idCentroHospitalario) {
        this.idCentroHospitalario = idCentroHospitalario;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }
}
