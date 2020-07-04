package com.example.cotecapp;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.cotecapp.Entidades.Paciente;
import com.example.cotecapp.Entidades.Patologia;
import com.example.cotecapp.Entidades.Ubicacion;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;

import java.util.ArrayList;
import java.util.Calendar;

public class RegistroContacto extends AppCompatActivity implements DatePickerDialog.OnDateSetListener{
    private Paciente pacienteActual;
    ArrayList<Ubicacion> listaUbicaciones;
    ArrayList<String> PatologiasData, listaUbi;
    ConexionSQLiteHelper conn;
    private EditText nombre, apellido1, apellido2, cedula, Fecha_nacimiento,
    nacionalidad, patologias, correo;
    private Utilidades U;
    private Spinner comboUbi, comboPatologia;
    ArrayList<Patologia> listaPatologias, listaPatologiasContacto;
    private Button cancelar, seleccionar, guardarPatologia, BorrarPatologia, registrar;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro_contacto);
        U = new Utilidades();
        listaPatologiasContacto = new ArrayList<>();
        conn = new ConexionSQLiteHelper(this, "CoTec", null, 1);
        Bundle pacienteRecibido = getIntent().getExtras();
        if(pacienteRecibido != null){
            Paciente paciente = (Paciente) pacienteRecibido.getSerializable("paciente");
            pacienteActual = paciente;
        }
        nombre = findViewById(R.id.Nombre);
        apellido1 = findViewById(R.id.Apellido1);
        apellido2 = findViewById(R.id.Apellido2);
        cedula = findViewById(R.id.Cedula);
        Fecha_nacimiento = findViewById(R.id.Fecha_N);
        nacionalidad = findViewById(R.id.Nacionalidad);
        patologias = (EditText) findViewById(R.id.Patologias);
        correo = findViewById(R.id.Correo);
        comboPatologia = findViewById(R.id.PatoloCombo);
        comboUbi = findViewById(R.id.ubicacionCombo);
        seleccionar = findViewById(R.id.seleccionarFechaNaci);
        cancelar = findViewById(R.id.CancelarRegistro);
        cancelar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                startActivity(intent);
            }

        });
        guardarPatologia = findViewById(R.id.GuardarPatologia);
        BorrarPatologia = findViewById(R.id.BorrarPatologia);
        registrar = findViewById(R.id.RegistrarBtn);
        guardarPatologia.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                GuadarPatologia();
            }
        });
        Fecha_nacimiento.setInputType(InputType.TYPE_NULL);
        patologias.setInputType(InputType.TYPE_NULL);
        ConsultarUbicaciones();
        registrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(validarCampos()){
                    registrarContacto();

                }
            }
        });
        seleccionar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDatePickerDialog();
            }
        });
        ArrayAdapter<CharSequence> adaptadorU = new ArrayAdapter(this,
                R.layout.spinner, listaUbi);
        comboUbi.setAdapter(adaptadorU);
        ConsultarPatologias();
        ArrayAdapter<CharSequence> adaptadorP = new ArrayAdapter(this,
                R.layout.spinner, PatologiasData);
        comboPatologia.setAdapter(adaptadorP);
        BorrarPatologia.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                patologias.setText("");
                listaPatologiasContacto = new ArrayList<>();
            }
        });

    }

    /**
     * Registra a un Contacto ejecutando los scripst de sql necesarios
     */
    public void registrarContacto(){
        SQLiteDatabase db = conn.getWritableDatabase();
        int posidUbi = comboUbi.getSelectedItemPosition() - 1;
        String idUbi = listaUbicaciones.get(posidUbi).getId().toString();

        String selectPersona = "SELECT * FROM "+U.NOMBRE_TABLA_PERSONA+" " +
                "WHERE "+U.PERSONA_CAMPO_CEDULA+"='"+cedula.getText()+"'";
        Cursor cursor = db.rawQuery(selectPersona, null);
        if(!cursor.moveToFirst()){
            String InsertPersona =
                    "INSERT INTO "+U.NOMBRE_TABLA_PERSONA+" " +
                            "("+U.PERSONA_CAMPO_CEDULA+", "+U.PERSONA_CAMPO_NOMBRE+", "
                            +U.PERSONA_CAMPO_PRIMER_APELLIDO+","+U.PERSONA_CAMPO_SEGUNDO_APELLIDO+"," +
                            " "+U.PERSONA_CAMPO_NACIONALIDAD+", "+U.PERSONA_CAMPO_FECHA_NACIMIENTO+", " +
                            ""+U.PERSONA_CAMPO_ID_UBICACION+" )" +
                            "VALUES ('"+cedula.getText().toString()+"', '"+nombre.getText().toString()+"', " +
                            " '"+apellido1.getText().toString()+"', '"+apellido2.getText().toString()+"', " +
                            " '"+nacionalidad.getText().toString()+"', '"+Fecha_nacimiento.getText().toString()+"'," +
                            " "+idUbi+");";
            db.execSQL(InsertPersona);
            agregarPatologias();
        }
        String selectContacto = "SELECT * FROM "+U.NOMBRE_TABLA_CONTACTO+" " +
                "WHERE "+U.TABLA_CONTACTO_CAMPO_CEDULA+"='"+cedula.getText()+"' AND " +
                U.TABLA_CONTACTO_CAMPO_ID_PACIENTE +"="+pacienteActual.getIdPaciente();
        cursor = db.rawQuery(selectContacto, null);
        if(!cursor.moveToFirst()){
            String InsertContacto = "INSERT INTO "+U.NOMBRE_TABLA_CONTACTO+"(" +
                    " "+U.TABLA_CONTACTO_CAMPO_CORREO+","+U.TABLA_CONTACTO_CAMPO_ID_PACIENTE+"" +
                    ","+U.TABLA_CONTACTO_CAMPO_CEDULA+" ) VALUES ('"+correo.getText().toString()+"'," +
                    " "+pacienteActual.getIdPaciente()+", '"+cedula.getText().toString()+"') ";
            db.execSQL(InsertContacto);
            db.close();
            Intent intent = new Intent(getApplicationContext(), ContactosDePaciente.class);
            Bundle bundle = new Bundle();
            bundle.putSerializable("paciente", pacienteActual);
            intent.putExtras(bundle);
            startActivity(intent);
        }else{
            CharSequence text = "El contacto ya existe.";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(getApplicationContext(), text, duration);
            toast.show();
            db.close();
        }


    }

    /**
     * Agrega las patologías de la persona en la base de datos
     */
    public void agregarPatologias(){
        SQLiteDatabase db = conn.getWritableDatabase();
        for(int i = 0; i < listaPatologiasContacto.size(); i++){
            Patologia patologia = listaPatologiasContacto.get(i);
            String personaPatologia = "INSERT INTO "+U.NOMBRE_TABLA_PERSONA_PATOLOGIA+"(" +
                    " "+U.TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA+","+
                    U.TABLA_PERSONA_PATOLOGIA_CAMPO_ID_PATOLOGIA+") VALUES" +
                    "('"+cedula.getText().toString()+"', "+patologia.getIdPatologia()+")";
            db.execSQL(personaPatologia);
        }
        db.close();
    }

    /**
     * Valida que los campos hayan sido completados de manera correcta
     * @return true si son validos todos los campos y false
     * si no se cumple al menos 1
     */
    public boolean validarCampos(){
        boolean retorno = true;
        if(nombre.getText().toString().isEmpty()){
            nombre.setError("Campo Obligatorio");
            retorno = false;
        }
        if(apellido1.getText().toString().isEmpty()){
            apellido1.setError("Campo Obligatorio");
            retorno = false;
        }
        if(apellido2.getText().toString().isEmpty()){
            apellido2.setError("Campo Obligatorio");
            retorno = false;
        }
        if(cedula.getText().toString().isEmpty()){
            cedula.setError("Campo Obligatorio");
            retorno = false;
        }
        if(Fecha_nacimiento.getText().toString().isEmpty()){
            Fecha_nacimiento.setError("Campo Obligatorio");
            retorno = false;
        }
        if(nacionalidad.getText().toString().isEmpty()){
            nacionalidad.setError("Campo Obligatorio");
            retorno = false;
        }
        if(comboUbi.getSelectedItemPosition() == 0){
            Context context = getApplicationContext();
            CharSequence text = "Seleccione una Ubicacion";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
            retorno = false;
        }

        return retorno;
    }

    /**
     * Consulta todas las patologias para añadirlas al spinner de patologias
     */
    public void ConsultarPatologias(){
        listaPatologias = new ArrayList<>();
        SQLiteDatabase db = conn.getWritableDatabase();
        String consultaPa = "SELECT * FROM "+U.NOMBRE_TABLA_PATOLOGIA;
        Cursor cursor = db.rawQuery(consultaPa, null);
        while(cursor.moveToNext()){
            Patologia patologia = new Patologia();
            patologia.setIdPatologia(cursor.getInt(0));
            patologia.setNombre(cursor.getString(1));
            patologia.setDescripcion(cursor.getString(2));
            patologia.setSintomas(cursor.getString(3));
            patologia.setTratamiento(cursor.getString(4));
            listaPatologias.add(patologia);
        }
        db.close();
        obtenerListaPatologias();
    }

    /**
     * Obtiene el array de strings que se le asigna al spinner de patologias
     */
    public void obtenerListaPatologias(){
        PatologiasData = new ArrayList<>();
        PatologiasData.add("Patologías");
        for (int i  = 0; i < listaPatologias.size(); i ++){
            Patologia patologia = listaPatologias.get(i);
            String patologiaData = patologia.getNombre();
            PatologiasData.add(patologiaData);

        }
    }

    /**
     * guarda la patologia seleccionada
     */
    public void GuadarPatologia(){
        int pospatologia = comboPatologia.getSelectedItemPosition() - 1;
        if(pospatologia >= 0){
            if(!ComprobarPatologia(pospatologia)){
                Patologia patologiapaciente = listaPatologias.get(pospatologia);
                String patologias = this.patologias.getText().toString();
                listaPatologiasContacto.add(patologiapaciente);
                if(patologias.equals("")){
                    patologias = patologiapaciente.getNombre();
                }else{
                    patologias = patologias +", "+patologiapaciente.getNombre();
                }
                this.patologias.setText(patologias);
            }
        }else{
            Context context = getApplicationContext();
            CharSequence text = "Seleccione la patología que desea agregar.";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
    }

    /**
     * Comprueba que la patología que se va a guardar no esté asignada ya
     * @param posPatologia se usa para identificar la posición de la patología en la lista
     * @return true si la encuentra en la lista y false si no la encuentra
     */
    public boolean ComprobarPatologia(int posPatologia){
        for(int i = 0; i < listaPatologiasContacto.size(); i++){
            int idPatologia = listaPatologiasContacto.get(i).getIdPatologia();
            if(idPatologia == listaPatologias.get(posPatologia).getIdPatologia()){
                Context context = getApplicationContext();
                CharSequence text = "Esta patologia ya ha sido agregada.";
                int duration = Toast.LENGTH_SHORT;
                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
                return true;
            }
        }
        return false;
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

    /**
     * Muestra el calendario para seleccionar la fecha
     */
    public void showDatePickerDialog(){
        DatePickerDialog datePickerDialog = new DatePickerDialog(
                this,
                this,
                Calendar.getInstance().get(Calendar.YEAR),
                Calendar.getInstance().get(Calendar.MONTH),
                Calendar.getInstance().get(Calendar.DAY_OF_MONTH));
        datePickerDialog.show();
    }
    /**
     * cuando se selecciona una fecha la asigna al textView
     * @param view
     * @param year
     * @param month
     * @param dayOfMonth
     */
    @Override
    public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
        String date = year + "-" + month + "-" + dayOfMonth ;
        Fecha_nacimiento.setText(date);
    }

}