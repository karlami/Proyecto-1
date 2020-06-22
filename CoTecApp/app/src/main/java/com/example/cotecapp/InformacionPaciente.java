package com.example.cotecapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.cotecapp.Entidades.Paciente;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;

public class InformacionPaciente extends AppCompatActivity {
    private TextView cedula, nombre, primerApellido, segundoApellido, nacionalidad, fechaI,
    ubicacion, internado, uci, hospital, estado, patologias, medicacion, fechaNacimiento;
    ConexionSQLiteHelper conn;
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

        Bundle pacienteRecibido = getIntent().getExtras();
        Paciente paciente = null;

        if(pacienteRecibido != null){
            paciente = (Paciente) pacienteRecibido.getSerializable("paciente");
            if(paciente.getUci() == 1){
                uci.setText("Sí");
            }else{
                uci.setText("No");
            }
            if(paciente.getInternado() == 1){
                internado.setText("Sí");
            }else{
                internado.setText("No");
            }
            fechaI.setText(paciente.getFechaIngreso());
            setearDatosPersonales(paciente.getCedula());
            setearCentroHospitalario(paciente.getIdCentroHospitalario());
            setearEstado(paciente.getIdPaciente());
            setearPatologías(paciente.getCedula());
            setearMedicacion(paciente.getIdPaciente());
        }

    }

    private void setearMedicacion(int idPaciente) {
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaEstado = "SELECT "+Utilidades.MEDICAMENTO_CAMPO_NOMBRE+" FROM "+
                Utilidades.NOMBRE_TABLA_PACIENTE_MEDICAMENTO +
                " JOIN "+Utilidades.NOMBRE_TABLA_MEDICAMENTO +
                " WHERE "+Utilidades.PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE+"="+idPaciente;
        Cursor cursor = db.rawQuery(consultaEstado,null);
        cursor.moveToFirst();
        if(cursor != null){
            medicacion.setText(cursor.getString(0));
        }
        db.close();
    }

    private void setearPatologías(String cedula) {
        SQLiteDatabase db = conn.getReadableDatabase();
        Context context = getApplicationContext();
        CharSequence text = "Seleccione un Medicamento";
        int duration = Toast.LENGTH_SHORT;
        Toast toast = Toast.makeText(context, cedula, duration);
        toast.show();
        String consultaPatologia = "SELECT "+Utilidades.PATOLOGIA_CAMPO_NOMBRE+" FROM "+
                Utilidades.NOMBRE_TABLA_PERSONA_PATOLOGIA +
                " JOIN "+Utilidades.NOMBRE_TABLA_PATOLOGIA +
                " WHERE "+Utilidades.TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA+"='"+cedula+"'";
        Cursor cursor = db.rawQuery(consultaPatologia,null);
        cursor.moveToFirst();
        if(cursor != null){
            patologias.setText(cursor.getString(0));
        }
        db.close();
    }

    private void setearEstado(Integer idPaciente) {
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaEstado = "SELECT * FROM "+ Utilidades.NOMBRE_TABLA_PACIENTE_ESTADO +
                " WHERE "+Utilidades.PACIENTE_ESTADO_CAMPO_ID_PACIENTE+"="+idPaciente;
        Cursor cursor = db.rawQuery(consultaEstado,null);
        cursor.moveToFirst();
        if(cursor != null){
            String estado = cursor.getString(2);
            this.estado.setText(estado);
        }
    }

    private void setearCentroHospitalario(int idHospital) {
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaHospital = "SELECT * FROM "+ Utilidades.NOMBRE_TABLA_CENTRO_HOSPITALARIO +
                " WHERE "+Utilidades.CENTRO_HOSPITALARIO_CAMPO_ID+"="+idHospital+"";
        Cursor cursor = db.rawQuery(consultaHospital,null);
        cursor.moveToFirst();
        if(cursor != null){
            String idhospital = cursor.getString(0);
            String nombre = cursor.getString(1);
            String hospi = idhospital+" - "+nombre;
            hospital.setText(hospi);
        }

        db.close();
    }

    private void setearDatosPersonales(String cedula) {
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaPersona = "SELECT * FROM "+ Utilidades.NOMBRE_TABLA_PERSONA +
                " WHERE "+Utilidades.PERSONA_CAMPO_CEDULA+"='"+cedula+"'";
        Cursor cursor = db.rawQuery(consultaPersona,null);
        cursor.moveToFirst();
        if(cursor != null){
            this.cedula.setText(cedula);
            nombre.setText(cursor.getString(1));
            primerApellido.setText(cursor.getString(2));
            segundoApellido.setText(cursor.getString(3));
            nacionalidad.setText(cursor.getString(4));
            fechaNacimiento.setText(cursor.getString(5));
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