package com.example.cotecapp;
import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.text.InputType;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.cotecapp.Entidades.Hospital;
import com.example.cotecapp.Entidades.Medicamento;
import com.example.cotecapp.Entidades.Ubicacion;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;

import java.util.ArrayList;
import java.util.Calendar;


public class RegistroPacientes extends AppCompatActivity implements DatePickerDialog.OnDateSetListener {
    private Spinner comboUbicacion, idHospitalCombo, Id_Medicamento_Combo;
    ArrayList<Ubicacion> listaUbicaciones;
    ArrayList<String> listaUbi;
    ArrayList<Hospital> listaHospitales;
    ArrayList<String> listaHospi;
    ArrayList<Medicamento> listaMedicamentos;
    ArrayList<String> listMedi;
    ConexionSQLiteHelper conn;
    CheckBox UCI, Internado;
    private Utilidades U;
    private EditText Nombre, Apellido1, Apellido2, Cedula, Nacionalidad, Fecha_Nacimiento,
            Estado, patologia, FechaIngreso, actualFecha;
    private int dia, mes, ano;
    private Button Registrar, Cancelar, seleccionarFechaIngreso, seleccionarFechaNacimiento;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro_pacientes);
        conn = new ConexionSQLiteHelper(this, "CoTec", null, 1);

        U = new Utilidades();

        seleccionarFechaNacimiento = findViewById(R.id.seleccionarFechaNaci);
        seleccionarFechaIngreso = findViewById(R.id.seleccionarFechaIngreso);
        Nombre = findViewById(R.id.Nombre);
        Apellido1 = findViewById(R.id.Apellido1);
        Apellido2 = findViewById(R.id.Apellido2);
        Cedula = findViewById(R.id.Cedula);
        Nacionalidad = findViewById(R.id.Nacionalidad);
        Fecha_Nacimiento = findViewById(R.id.Fecha_N);
        Estado = findViewById(R.id.Estado);
        Internado = findViewById(R.id.Internado);
        UCI = findViewById(R.id.UCI);
        FechaIngreso = findViewById(R.id.Fecha_I);
        Id_Medicamento_Combo = findViewById(R.id.Id_Medicamento);
        patologia = findViewById(R.id.Patologias);
        idHospitalCombo = findViewById(R.id.idCentroHospitalario);

        ConsultarUbicaciones();
        comboUbicacion = (Spinner) findViewById(R.id.ubicacionCombo);
        ArrayAdapter<CharSequence> adaptadorU = new ArrayAdapter(this,
                R.layout.spinner, listaUbi);
        comboUbicacion.setAdapter(adaptadorU);

        ConsultarHospitales();
        idHospitalCombo = (Spinner) findViewById(R.id.idCentroHospitalario);
        ArrayAdapter<CharSequence> adaptadorH = new ArrayAdapter(this,
                R.layout.spinner, listaHospi);
        idHospitalCombo.setAdapter(adaptadorH);

        ConsultarMedicamentos();
        Id_Medicamento_Combo = (Spinner) findViewById(R.id.Id_Medicamento);
        ArrayAdapter<CharSequence> adaptadorM = new ArrayAdapter(this,
                R.layout.spinner, listMedi);
        Id_Medicamento_Combo.setAdapter(adaptadorM);


        Registrar = findViewById(R.id.RegistrarBtn);
        Fecha_Nacimiento.setInputType(InputType.TYPE_NULL);

        seleccionarFechaNacimiento.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                actualFecha = Fecha_Nacimiento;
                showDatePickerDialog();
            }
        });
        seleccionarFechaIngreso.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                actualFecha = FechaIngreso;
                showDatePickerDialog();
            }
        });
        Registrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EjecutarRegistro();
            }
        });
        findViewById(R.id.CancelarRegistro).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                volverAlMain();
            }
        });




    }

    public void showDatePickerDialog(){
        DatePickerDialog datePickerDialog = new DatePickerDialog(
                this,
                this,
                Calendar.getInstance().get(Calendar.YEAR),
                Calendar.getInstance().get(Calendar.MONTH),
                Calendar.getInstance().get(Calendar.DAY_OF_MONTH));
        datePickerDialog.show();
    }

    @Override
    public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
        String date = year + "-" + month + "-" + dayOfMonth ;
        actualFecha.setText(date);
    }

    public void EjecutarRegistro(){
        if(validarCampos()){
            registrarPaciente();
        }
    }
    public void registrarPaciente(){
        String internadoCheck = "0";
        String uciCheck = "0";
        if(Internado.isChecked()){
            internadoCheck = "1";
        }
        if(UCI.isChecked()){
            uciCheck = "1";
        }

        SQLiteDatabase db = conn.getWritableDatabase();
        int posidUbi = comboUbicacion.getSelectedItemPosition() - 1;
        String idUbi = listaUbicaciones.get(posidUbi).getId().toString();
        int posIdHospi = idHospitalCombo.getSelectedItemPosition() - 1;
        String IdHospi = listaHospitales.get(posIdHospi).getIdCentroHospitalario().toString();
        String InsertPersona =
                "INSERT INTO "+U.NOMBRE_TABLA_PERSONA+" " +
                        "("+U.PERSONA_CAMPO_CEDULA+", "+U.PERSONA_CAMPO_NOMBRE+", "
                        +U.PERSONA_CAMPO_PRIMER_APELLIDO+","+U.PERSONA_CAMPO_SEGUNDO_APELLIDO+"," +
                        " "+U.PERSONA_CAMPO_NACIONALIDAD+", "+U.PERSONA_CAMPO_FECHA_NACIMIENTO+", " +
                        ""+U.PERSONA_CAMPO_ID_UBICACION+" )" +
                "VALUES ('"+Cedula.getText().toString()+"', '"+Nombre.getText().toString()+"', " +
                        " '"+Apellido1.getText().toString()+"', '"+Apellido2.getText().toString()+"', " +
                        " '"+Nacionalidad.getText().toString()+"', '"+Fecha_Nacimiento.getText().toString()+"'," +
                        " "+idUbi+");";

        db.execSQL(InsertPersona);

        String InsertPaciente = "INSERT INTO "+U.NOMBRE_TABLA_PACIENTE+"("+
                U.TABLA_PACIENTE_CAMPO_INTERNADO+","+U.TABLA_PACIENTE_CAMPO_UCI+","+
                U.TABLA_PACIENTE_CAMPO_FECHA_INGRES+","+U.TABLA_PACIENTE_CAMPO_ID_CENTRO_HOSPI+","+
                U.TABLA_PACIENTE_CAMPO_CEDULA+") " +
                "VALUES ("+internadoCheck+","+uciCheck+"," +
                "'"+FechaIngreso.getText().toString()+"', "+IdHospi+", '"+
                Cedula.getText().toString()+"');";

        db.execSQL(InsertPaciente);
        Cursor c = db.rawQuery("SELECT * FROM "+U.NOMBRE_TABLA_PACIENTE+" WHERE "+
                U.TABLA_PACIENTE_CAMPO_CEDULA+" = '"+Cedula.getText().toString()+"' ", null);
        c.moveToFirst();
        String idPaciente = c.getString(0);

        String insertPacienteEstado = "INSERT INTO "+U.NOMBRE_TABLA_PACIENTE_ESTADO+
                "("+U.PACIENTE_ESTADO_CAMPO_ID_PACIENTE+", "+
                U.PACIENTE_ESTADO_CAMPO_ESTADO+") VALUES("+idPaciente+", " +
                " '"+Estado.getText().toString()+"')";
        db.execSQL(insertPacienteEstado);

        String personaPatologia = "INSERT INTO "+U.NOMBRE_TABLA_PERSONA_PATOLOGIA+"(" +
                " "+U.TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA+","+
                U.TABLA_PERSONA_PATOLOGIA_CAMPO_ID_PATOLOGIA+") VALUES" +
                "('"+Cedula.getText().toString()+"', "+patologia.getText().toString()+")";
        db.execSQL(personaPatologia);

        int posMedicamento = Id_Medicamento_Combo.getSelectedItemPosition() - 1;
        String idMedicamento = listaMedicamentos.get(posMedicamento).getIdMedicamento().toString();
        String pacienteMedicamento = "INSERT INTO "+U.NOMBRE_TABLA_PACIENTE_MEDICAMENTO+"" +
                "("+U.PACIENTE_MEDICAMENTO_CAMPO_ID_MEDICAMENTO+", "+U.PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE+
                ") VALUES("+idMedicamento+", "+idPaciente+")";
        db.execSQL(pacienteMedicamento);

        db.close();
    }
    public void volverAlMain(){
         Intent intent = new Intent(this, MainActivity.class);
         startActivity(intent);
    }

    public boolean validarCampos(){
        boolean retorno = true;
        if(Nombre.getText().toString().isEmpty()){
            Nombre.setError("Campo Obligatorio");
            retorno = false;
        }
        if(Apellido1.getText().toString().isEmpty()){
            Apellido1.setError("Campo Obligatorio");
            retorno = false;
        }
        if(Apellido2.getText().toString().isEmpty()){
            Apellido2.setError("Campo Obligatorio");
            retorno = false;
        }
        if(Cedula.getText().toString().isEmpty()){
            Cedula.setError("Campo Obligatorio");
            retorno = false;
        }
        if(Fecha_Nacimiento.getText().toString().isEmpty()){
            Fecha_Nacimiento.setError("Campo Obligatorio");
            retorno = false;
        }
        if(Nacionalidad.getText().toString().isEmpty()){
            Nacionalidad.setError("Campo Obligatorio");
            retorno = false;
        }
        if(comboUbicacion.getSelectedItemPosition() == 0){
            Context context = getApplicationContext();
            CharSequence text = "Seleccione una Ubicacion";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
            retorno = false;
        }
        if(idHospitalCombo.getSelectedItemPosition() == 0){
            Context context = getApplicationContext();
            CharSequence text = "Seleccione un Hospital";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
            retorno = false;
        }
        if(Estado.getText().toString().isEmpty()){
            Estado.setError("Campo Obligatorio");
            retorno = false;
        }
        if(FechaIngreso.getText().toString().isEmpty()){
            FechaIngreso.setError("Campo Obligatorio");
            retorno = false;
        }
        if(Fecha_Nacimiento.getText().toString().isEmpty()){
            FechaIngreso.setError("Campo Obligatorio");
            retorno = false;
        }
        if(Id_Medicamento_Combo.getSelectedItemPosition() == 0){
            Context context = getApplicationContext();
            CharSequence text = "Seleccione un Medicamento";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
            retorno = false;
        }
        if(patologia.getText().toString().isEmpty()){
            patologia.setError("Campo Obligatorio");
            retorno = false;
        }

        return retorno;
    }

    public void ConsultarUbicaciones(){
        SQLiteDatabase db = conn.getReadableDatabase();
        Ubicacion ubicacion = null;
        listaUbicaciones = new ArrayList<Ubicacion>();

        Cursor cursor = db.rawQuery("SELECT * FROM " +U.NOMBRE_TABLA_UBICACION, null);
        while (cursor.moveToNext()){
            ubicacion = new Ubicacion();
            ubicacion.setId(cursor.getInt(0));
            ubicacion.setContinente(cursor.getString(1));
            ubicacion.setPais(cursor.getString(2));
            ubicacion.setRegion(cursor.getString(3));
            listaUbicaciones.add(ubicacion);
        }
        db.close();
        ObtenerListaUbicaciones();
    }

    public void ObtenerListaUbicaciones(){
        listaUbi = new ArrayList<String>();
        listaUbi.add("Seleccione la Ubicación");
        for(int i = 0; i < listaUbicaciones.size(); i++){
            listaUbi.add(listaUbicaciones.get(i).getId()+"-"+listaUbicaciones.get(i).getContinente()+"-"+
                    listaUbicaciones.get(i).getPais()+"-"+listaUbicaciones.get(i).getRegion());
        }
    }

    public void ConsultarHospitales(){
        SQLiteDatabase db = conn.getReadableDatabase();
        Hospital hospi = null;
        listaHospitales = new ArrayList<Hospital>();

        Cursor cursor = db.rawQuery("SELECT * FROM " +U.NOMBRE_TABLA_CENTRO_HOSPITALARIO, null);
        while (cursor.moveToNext()){
            hospi = new Hospital();
            hospi.setIdCentroHospitalario(cursor.getInt(0));
            hospi.setNombre(cursor.getString(1));
            hospi.setCapacidad(cursor.getInt(2));
            hospi.setCapacidadUci(cursor.getInt(3));
            hospi.setContacto(cursor.getString(4));
            hospi.setDirector(cursor.getString(5));
            hospi.setIdUbicacion(cursor.getString(6));

            listaHospitales.add(hospi);
        }
        db.close();
        ObtenerListaHospitales();
    }

    public void ObtenerListaHospitales(){
        listaHospi = new ArrayList<String>();
        listaHospi.add("Seleccione el Hospital");
        for(int i = 0; i < listaHospitales.size(); i++){
            listaHospi.add(listaHospitales.get(i).getIdCentroHospitalario()+"-"+
                    listaHospitales.get(i).getNombre());
        }
    }

    private void ConsultarMedicamentos() {
        SQLiteDatabase db = conn.getReadableDatabase();
        Medicamento medi = null;
        listaMedicamentos = new ArrayList<Medicamento>();

        Cursor cursor = db.rawQuery("SELECT * FROM " +U.NOMBRE_TABLA_MEDICAMENTO, null);
        while (cursor.moveToNext()){
            medi = new Medicamento();
            medi.setIdMedicamento(cursor.getInt(0));
            medi.setNombre(cursor.getString(1));
            medi.setDescripcion(cursor.getString(2));
            medi.setCasaFarmaceutica(cursor.getString(3));

            listaMedicamentos.add(medi);
        }
        db.close();
        ObtenerMedicamentos();
    }
    public void ObtenerMedicamentos(){
        listMedi = new ArrayList<String>();
        listMedi.add("Seleccione el Medicamento");
        for(int i = 0; i < listaMedicamentos.size(); i++){
            listMedi.add(listaMedicamentos.get(i).getIdMedicamento()+"-"+
                    listaMedicamentos.get(i).getNombre());
        }
    }



}