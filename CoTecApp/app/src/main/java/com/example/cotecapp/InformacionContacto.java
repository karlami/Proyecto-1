package com.example.cotecapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import com.example.cotecapp.Entidades.Contacto;
import com.example.cotecapp.Entidades.Paciente;
import com.example.cotecapp.Entidades.Persona;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;

public class InformacionContacto extends AppCompatActivity {
    private Contacto contactoActual;
    private ConexionSQLiteHelper conn;
    private Persona personaActual;
    private Paciente pacienteActual;
    private TextView cedula, nombre, apellido1, apellido2, nacionalidad, fecha_nacimiento,
            ubicacion, patologias, correo, pacienteAsociado;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_informacion_contacto);
        conn = new ConexionSQLiteHelper(this, "CoTec", null, 1);
        pacienteActual = new Paciente();
        cedula = findViewById(R.id.cedulaContacto);
        nombre = findViewById(R.id.nombreContacto);
        apellido1 = findViewById(R.id.primerApe);
        apellido2 = findViewById(R.id.segundoApe);
        nacionalidad = findViewById(R.id.nacionalidadContacto);
        fecha_nacimiento = findViewById(R.id.fechaNacimiento);
        ubicacion = findViewById(R.id.ubicacion);
        patologias = findViewById(R.id.personaPatologia);
        correo = findViewById(R.id.Correo);
        findViewById(R.id.BorrarContacto).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                borrarContacto();
            }
        });
        pacienteAsociado = findViewById(R.id.Paciente);
        findViewById(R.id.editarInfo).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), ActualizarContacto.class);
                Bundle bundle = new Bundle();
                bundle.putSerializable("contacto", contactoActual);
                bundle.putSerializable("paciente", pacienteActual);
                intent.putExtras(bundle);
                startActivity(intent);
            }
        });
        findViewById(R.id.Volver).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), ContactosDePaciente.class);
                Bundle bundle = new Bundle();
                bundle.putSerializable("paciente", pacienteActual);
                intent.putExtras(bundle);
                startActivity(intent);
            }
        });
        Bundle contactoRecibido = getIntent().getExtras();
        if(contactoRecibido != null){
            Contacto contacto = (Contacto) contactoRecibido.getSerializable("contacto");
            contactoActual = contacto;
            setearDatosPersonales(contacto.getCedula());
            correo.setText(contacto.getCorreo());
            setearPatologias(contacto.getCedula());
            setearPaciente(contacto.getIdPaciente());
            pacienteActual = new Paciente();
            pacienteActual.setIdPaciente(contacto.getIdPaciente());
        }

    }
    public void borrarContacto(){
        SQLiteDatabase db = conn.getWritableDatabase();
        String deleteContacto = "DELETE FROM "+Utilidades.NOMBRE_TABLA_CONTACTO+
                " WHERE "+Utilidades.TABLA_CONTACTO_CAMPO_ID_CONTACTO+"="+contactoActual.getIdContacto()+"";
        db.execSQL(deleteContacto);

        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
    }
    public void setearPaciente(Integer idPaciente){
        SQLiteDatabase db = conn.getWritableDatabase();
        String consultarPaciente = "SELECT "+Utilidades.PERSONA_CAMPO_NOMBRE+"," +
                " PA."+Utilidades.TABLA_PACIENTE_CAMPO_CEDULA+" FROM " +
                " "+Utilidades.NOMBRE_TABLA_PACIENTE+" AS PA, " +
                " "+Utilidades.NOMBRE_TABLA_PERSONA+" AS PE WHERE " +
                " PA."+Utilidades.TABLA_PACIENTE_CAMPO_ID_PACIENTE+" = "+idPaciente+
                " AND PA."+Utilidades.TABLA_PACIENTE_CAMPO_CEDULA+" = " +
                " PE."+Utilidades.PERSONA_CAMPO_CEDULA;
        Cursor cursor = db.rawQuery(consultarPaciente, null);
        cursor.moveToFirst();
        pacienteAsociado.setText(cursor.getString(0));
        pacienteActual.setCedula(cursor.getString(1));
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
    private void setearDatosPersonales(String cedula) {
        personaActual = new Persona();
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaPersona = "SELECT * FROM "+ Utilidades.NOMBRE_TABLA_PERSONA +
                " WHERE "+Utilidades.PERSONA_CAMPO_CEDULA+"='"+cedula+"'";
        Cursor cursor = db.rawQuery(consultaPersona,null);
        cursor.moveToFirst();
        if(cursor != null){
            this.cedula.setText(cedula);
            personaActual.setCedula(cedula);
            nombre.setText(cursor.getString(1));
            personaActual.setNombre(cursor.getString(1));
            apellido1.setText(cursor.getString(2));
            personaActual.setPrimerApellido(cursor.getString(2));
            apellido2.setText(cursor.getString(3));
            personaActual.setSegundoApellido(cursor.getString(3));
            nacionalidad.setText(cursor.getString(4));
            personaActual.setNacionalidad(cursor.getString(4));
            fecha_nacimiento.setText(cursor.getString(5));
            personaActual.setFechaNacimiento(cursor.getString(5));
            personaActual.setIdUbicacion(cursor.getInt(6));
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