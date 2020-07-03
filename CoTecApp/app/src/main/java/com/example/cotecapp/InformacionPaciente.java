package com.example.cotecapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.example.cotecapp.Entidades.Hospital;
import com.example.cotecapp.Entidades.Medicamento;
import com.example.cotecapp.Entidades.Paciente;
import com.example.cotecapp.Entidades.Patologia;
import com.example.cotecapp.Entidades.Persona;
import com.example.cotecapp.Entidades.Ubicacion;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;

import java.util.ArrayList;

public class InformacionPaciente extends AppCompatActivity {
    private TextView cedula, nombre, primerApellido, segundoApellido, nacionalidad, fechaI,
    ubicacion, internado, uci, hospital, estado, patologias, medicacion, fechaNacimiento;
    ConexionSQLiteHelper conn;
    private Button actualizarInfo, cancelar, MostrarContactos, EliminarPaciente;
    private Persona PersonaActual;
    private Paciente PacienteActual;
    private Hospital HospitalActual;
    private ArrayList<Medicamento> MedicamentosActuales;
    private Ubicacion UbicacionActual;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_informacion_paciente);
        conn = new ConexionSQLiteHelper(this, "CoTec", null, 1);
        cedula = findViewById(R.id.cedulaPaciente);
        nombre = findViewById(R.id.nombrePaciente);
        primerApellido = findViewById(R.id.primerApe);
        segundoApellido = findViewById(R.id.segundoApe);
        nacionalidad = findViewById(R.id.nacionalidadPaciente);
        fechaI = findViewById(R.id.fechaI);
        fechaNacimiento = findViewById(R.id.fechaNacimiento);
        ubicacion = findViewById(R.id.ubicacionPaciente);
        internado = findViewById(R.id.internadoPaciente);
        uci = findViewById(R.id.UCI);
        hospital = findViewById(R.id.centroHospitalario);
        estado = findViewById(R.id.estadopaciente);
        patologias = findViewById(R.id.personaPatologia);
        medicacion = findViewById(R.id.medicamentoPaciente);
        actualizarInfo = findViewById(R.id.editarInfo);
        EliminarPaciente = findViewById(R.id.EliminarPaciente);
        EliminarPaciente.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                borrarPaciente();
            }
        });
        actualizarInfo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                editarinformacion();
            }
        });
        cancelar = findViewById(R.id.Volver);
        cancelar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                volverAlMain();
            }
        });
        Bundle pacienteRecibido = getIntent().getExtras();
        Paciente paciente = null;
        MostrarContactos = findViewById(R.id.MostrarContactos);
        MostrarContactos.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MostrarContactos();
            }
        });

        if(pacienteRecibido != null){
            paciente = (Paciente) pacienteRecibido.getSerializable("paciente");
            PacienteActual = paciente;
            if(paciente.getUci().equals("true")){
                uci.setText("Sí");
            }else{
                uci.setText("No");
            }
            if(paciente.getInternado().equals("true")){
                internado.setText("Sí");
            }else{
                internado.setText("No");
            }
            fechaI.setText(paciente.getFechaIngreso());
            setearDatosPersonales(paciente.getCedula());
            setearCentroHospitalario(paciente.getIdCentroHospitalario());
            setearEstado(paciente.getIdEstado());
            setearPatologias(paciente.getCedula());
            setearMedicacion(paciente.getIdPaciente());
        }

    }
    public void borrarPaciente(){
        SQLiteDatabase db = conn.getWritableDatabase();
        String deletePaciente = "DELETE FROM "+Utilidades.NOMBRE_TABLA_PACIENTE+
                " WHERE "+Utilidades.TABLA_PACIENTE_CAMPO_CEDULA+"='"+cedula.getText()+"'";
        db.execSQL(deletePaciente);
        String deleteMedicacionPaciente = "DELETE FROM "+Utilidades.NOMBRE_TABLA_PACIENTE_MEDICAMENTO+
                " WHERE "+Utilidades.PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE+"="+PacienteActual.getIdPaciente();
        db.execSQL(deleteMedicacionPaciente);
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    }
    public void MostrarContactos(){
        Intent intent = new Intent(this, ContactosDePaciente.class);
        Bundle bundle = new Bundle();
        bundle.putSerializable("paciente", PacienteActual);
        intent.putExtras(bundle);
        startActivity(intent);
    }
    public void editarinformacion(){
        Intent intent = new Intent(this, ActualizarPaciente.class);
        Bundle bundle = new Bundle();
        bundle.putSerializable("paciente", PacienteActual);
        bundle.putSerializable("persona", PersonaActual);
        intent.putExtras(bundle);
        startActivity(intent);
    }
    public void volverAlMain(){
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);

    }

    private void setearMedicacion(int idPaciente) {
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaMedicamento = "SELECT "+Utilidades.MEDICAMENTO_CAMPO_NOMBRE+" FROM "+
                Utilidades.NOMBRE_TABLA_PACIENTE_MEDICAMENTO + " AS PM" +
                ","+Utilidades.NOMBRE_TABLA_MEDICAMENTO+" AS M" +
                " WHERE "+Utilidades.PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE+"="+idPaciente
                +" AND PM."+Utilidades.PACIENTE_MEDICAMENTO_CAMPO_ID_MEDICAMENTO+
                "= M."+Utilidades.MEDICAMENTO_CAMPO_ID_MEDICAMENTO;
        Cursor cursor = db.rawQuery(consultaMedicamento,null);
        String medicamentos = "";
        while(cursor.moveToNext()){
            if(medicamentos.equals("")){
                medicamentos = medicamentos+cursor.getString(0);
            }else{
                medicamentos = medicamentos+", "+cursor.getString(0);
            }
            Medicamento medicamento = new Medicamento();
        }
        medicacion.setText(medicamentos);
        db.close();
    }

    private void setearPatologias(String cedula) {
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaMedicamento = "SELECT "+Utilidades.PATOLOGIA_CAMPO_NOMBRE+" FROM "+
                Utilidades.NOMBRE_TABLA_PATOLOGIA + " AS P" +
                ","+Utilidades.NOMBRE_TABLA_PERSONA_PATOLOGIA+" AS PP" +
                " WHERE "+Utilidades.TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA+"='"+cedula+"'"+
                " AND PP."+Utilidades.TABLA_PERSONA_PATOLOGIA_CAMPO_ID_PATOLOGIA+
                "= P."+Utilidades.PATOLOGIA_CAMPO_ID;
        Cursor cursor = db.rawQuery(consultaMedicamento,null);
        String patologias = "";
        while(cursor.moveToNext()){
            if(patologias.equals("")){
                patologias = patologias+cursor.getString(0);
            }else{
                patologias = patologias+", "+cursor.getString(0);
            }
        }
        this.patologias.setText(patologias);
        db.close();
    }


    private void setearEstado(Integer idEstado) {
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaEstado = "SELECT "+Utilidades.ESTADO_PACIENTE_CAMPO_ESTADO+" FROM "
                + Utilidades.NOMBRE_TABLA_ESTADO_PACIENTE +
                " WHERE "+Utilidades.ESTADO_PACIENTE_CAMPO_IDESTADO+"="+idEstado;
        Cursor cursor = db.rawQuery(consultaEstado,null);
        cursor.moveToFirst();
        if(cursor != null){
            String estado = cursor.getString(0);
            this.estado.setText(estado);
        }
    }

    private void setearCentroHospitalario(int idHospital) {
        SQLiteDatabase db = conn.getReadableDatabase();
        HospitalActual = new Hospital();
        HospitalActual.setIdCentroHospitalario(idHospital);
        String consultaHospital = "SELECT * FROM "+ Utilidades.NOMBRE_TABLA_CENTRO_HOSPITALARIO +
                " WHERE "+Utilidades.CENTRO_HOSPITALARIO_CAMPO_ID+"="+idHospital+"";
        Cursor cursor = db.rawQuery(consultaHospital,null);
        cursor.moveToFirst();
        if(cursor != null){
            String nombre = cursor.getString(1);
            String hospi = idHospital+" - "+nombre;
            hospital.setText(hospi);
        }

        db.close();
    }

    private void setearDatosPersonales(String cedula) {
        PersonaActual = new Persona();
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaPersona = "SELECT * FROM "+ Utilidades.NOMBRE_TABLA_PERSONA +
                " WHERE "+Utilidades.PERSONA_CAMPO_CEDULA+"='"+cedula+"'";
        Cursor cursor = db.rawQuery(consultaPersona,null);
        cursor.moveToFirst();
        if(cursor != null){
            this.cedula.setText(cedula);
            PersonaActual.setCedula(cedula);
            nombre.setText(cursor.getString(1));
            PersonaActual.setNombre(cursor.getString(1));
            primerApellido.setText(cursor.getString(2));
            PersonaActual.setPrimerApellido(cursor.getString(2));
            segundoApellido.setText(cursor.getString(3));
            PersonaActual.setSegundoApellido(cursor.getString(3));
            nacionalidad.setText(cursor.getString(4));
            PersonaActual.setNacionalidad(cursor.getString(4));
            fechaNacimiento.setText(cursor.getString(5));
            PersonaActual.setFechaNacimiento(cursor.getString(5));
            PersonaActual.setIdUbicacion(cursor.getInt(6));
            PacienteActual.setCedula(cedula);
            setearUbicacion(cursor.getString(6));
        }

        db.close();
    }

    private void setearUbicacion(String idUbicacion) {
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaUbicacion = "SELECT * FROM "+ Utilidades.NOMBRE_TABLA_UBICACION +
                " WHERE "+Utilidades.UBICACION_CAMPO_ID+"="+idUbicacion;
        Cursor cursor = db.rawQuery(consultaUbicacion,null);
        cursor.moveToFirst();
        if(cursor != null){
            String conti = cursor.getString(1);
            String pais = cursor.getString(2);
            String region = cursor.getString(3);
            String Ubicacion = idUbicacion+" - "+conti+" - "+pais+" - "+region;
            ubicacion.setText(Ubicacion);
        }
        db.close();
    }

}