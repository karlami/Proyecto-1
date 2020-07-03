package com.example.cotecapp.Entidades;

import java.io.Serializable;

public class Paciente implements Serializable {
    private Integer idPaciente;
    private String internado;
    private String uci;
    private String fechaIngreso;
    private Integer idCentroHospitalario;
    private String cedula;
    private Integer idEstado;

    public Paciente(Integer idEstado,Integer idPaciente, String internado, String uci, String fechaIngreso, Integer idCentroHospitalario, String cedula) {
        this.idPaciente = idPaciente;
        this.internado = internado;
        this.uci = uci;
        this.fechaIngreso = fechaIngreso;
        this.idCentroHospitalario = idCentroHospitalario;
        this.cedula = cedula;
        this.idEstado = idEstado;

    }
    public Paciente(){};

    public Integer getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(Integer idEstado) {
        this.idEstado = idEstado;
    }

    public Integer getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Integer idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getInternado() {
        return internado;
    }

    public void setInternado(String internado) {
        this.internado = internado;
    }

    public String getUci() {
        return uci;
    }

    public void setUci(String uci) {
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
