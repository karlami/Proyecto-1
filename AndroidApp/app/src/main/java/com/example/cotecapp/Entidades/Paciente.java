package com.example.cotecapp.Entidades;

public class Paciente {
    private String estado;
    private String internado;
    private String UCI;
    private String Fecha_Ingreso;
    private String Cédula;

    public Paciente(String estado, String internado, String UCI, String fecha_Ingreso, String cédula) {
        this.estado = estado;
        this.internado = internado;
        this.UCI = UCI;
        Fecha_Ingreso = fecha_Ingreso;
        Cédula = cédula;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getInternado() {
        return internado;
    }

    public void setInternado(String internado) {
        this.internado = internado;
    }

    public String getUCI() {
        return UCI;
    }

    public void setUCI(String UCI) {
        this.UCI = UCI;
    }

    public String getFecha_Ingreso() {
        return Fecha_Ingreso;
    }

    public void setFecha_Ingreso(String fecha_Ingreso) {
        Fecha_Ingreso = fecha_Ingreso;
    }

    public String getCédula() {
        return Cédula;
    }

    public void setCédula(String cédula) {
        Cédula = cédula;
    }
}
