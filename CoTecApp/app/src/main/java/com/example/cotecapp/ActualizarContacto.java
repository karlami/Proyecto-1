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

import com.example.cotecapp.Entidades.Contacto;
import com.example.cotecapp.Entidades.Paciente;
import com.example.cotecapp.Entidades.Patologia;
import com.example.cotecapp.Entidades.Persona;
import com.example.cotecapp.Entidades.Ubicacion;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;

import java.util.ArrayList;
import java.util.Calendar;

/**
 * Clase que controla la actividad de Actualizar un Contacto
 */
public class ActualizarContacto extends AppCompatActivity implements DatePickerDialog.OnDateSetListener{
    /**
     * Creacion de las variables necesarias para el funcionamiento
     */
    private Boolean patologiaCambio;
    private Contacto contactoActual;
    private Paciente pacienteActual;
    ArrayList<Ubicacion> listaUbicaciones;
    ArrayList<String> PatologiasData, listaUbi;
    ConexionSQLiteHelper conn;
    private EditText nombre, apellido1, apellido2, cedula, Fecha_nacimiento,
            nacionalidad, patologias, correo;
    private Utilidades U;
    private Spinner comboUbi, comboPatologia;
    private Persona personaActual;
    ArrayList<Patologia> listaPatologias, listaPatologiasContacto;
    private Button cancelar, seleccionar, guardarPatologia, BorrarPatologia, registrar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_actualizar_contacto);
        /**
         * Asignación de las variables necesarias para el funcionamiento
         */
        U = new Utilidades();
        patologiaCambio = false;
        listaPatologiasContacto = new ArrayList<>();
        conn = new ConexionSQLiteHelper(this, "CoTec", null, 1);
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
                patologiaCambio = true;GuadarPatologia();
            }
        });
        Fecha_nacimiento.setInputType(InputType.TYPE_NULL);
        patologias.setInputType(InputType.TYPE_NULL);
        ConsultarUbicaciones();
        registrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(validarCampos()){
                    actualizarContacto();
                    Intent intent = new Intent(getApplicationContext(), ContactosDePaciente.class);
                    Bundle bundle = new Bundle();
                    bundle.putSerializable("paciente", pacienteActual);
                    intent.putExtras(bundle);
                    startActivity(intent);
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
                patologiaCambio = true;
                patologias.setText("");
                listaPatologiasContacto = new ArrayList<>();
            }
        });
        Bundle contactoRecibido = getIntent().getExtras();
        if(contactoRecibido != null){
            contactoActual = (Contacto) contactoRecibido.getSerializable("contacto");
            pacienteActual = (Paciente) contactoRecibido.getSerializable("paciente");
            setearDatosPersonales(contactoActual.getCedula());
            correo.setText(contactoActual.getCorreo());
            setearPatologias(contactoActual.getCedula());
        }
    }

    /**
     * A partir de una cedula, asigna la data de persona al formulario
     * de actualizar paciente
     * @param cedula
     */
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
            Fecha_nacimiento.setText(cursor.getString(5));
            personaActual.setFechaNacimiento(cursor.getString(5));
            personaActual.setIdUbicacion(cursor.getInt(6));
            setearUbicacion(cursor.getInt(6));
        }
        db.close();
    }

    /**
     * Recopila la información ingresada por el Usuario y ejecuta
     * los scripts para actualizar el contacto en base a esa información
     */
    public void actualizarContacto(){

        SQLiteDatabase db = conn.getWritableDatabase();
        int posidUbi = comboUbi.getSelectedItemPosition() - 1;
        String idUbi = listaUbicaciones.get(posidUbi).getId().toString();

        String updatePersona = "UPDATE "+U.NOMBRE_TABLA_PERSONA+" "+
                "SET "+U.PERSONA_CAMPO_CEDULA+"='"+cedula.getText().toString()+"',"
                +U.PERSONA_CAMPO_NOMBRE+"='"+nombre.getText().toString()+"',"
                +U.PERSONA_CAMPO_PRIMER_APELLIDO+"='"+apellido1.getText().toString()+"',"
                +U.PERSONA_CAMPO_SEGUNDO_APELLIDO+"='"+apellido2.getText().toString()+"',"
                +U.PERSONA_CAMPO_NACIONALIDAD+"='"+nacionalidad.getText().toString()+"',"
                +U.PERSONA_CAMPO_FECHA_NACIMIENTO+"='"+Fecha_nacimiento.getText().toString()+"',"
                +U.PERSONA_CAMPO_ID_UBICACION+"="+idUbi+
                " WHERE "+U.PERSONA_CAMPO_CEDULA+"='"+cedula.getText().toString()+"'";
        db.execSQL(updatePersona);

        String updateContacto = "UPDATE "+U.NOMBRE_TABLA_CONTACTO+" "+
                "SET "+U.TABLA_CONTACTO_CAMPO_CORREO+"='"+U.TABLA_CONTACTO_CAMPO_CORREO+"',"+
                " "+U.TABLA_CONTACTO_CAMPO_ID_PACIENTE+"="+pacienteActual.getIdPaciente()+", "+
                " "+U.TABLA_CONTACTO_CAMPO_CEDULA+"='"+cedula.getText()+"'"+
                " WHERE "+U.TABLA_CONTACTO_CAMPO_ID_CONTACTO+"="+contactoActual.getIdContacto();

        db.execSQL(updateContacto);
        if(patologiaCambio == true){
            borrarPatologias();
            agregarPatologias();
        }
        db.close();
    }

    /**
     * Permite borrar las patologias del contacto para luego colocarle nuevas
     */
    public void borrarPatologias(){
        String deletePatologias = "DELETE FROM "+U.NOMBRE_TABLA_PERSONA_PATOLOGIA
                +" WHERE "+U.TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA+"='"
                +cedula.getText()+"'";

        SQLiteDatabase db = conn.getWritableDatabase();
        db.execSQL(deletePatologias);
        db.close();
    }

    /**
     * Guarda la patologia seleccionada en el Spinner de patologias
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
     * En base al idUbicacion que recibe asigna el valor en el formulario
     * para su posterior actualización
     * @param idUbicacion
     */
    public void setearUbicacion(Integer idUbicacion){
        for(int i = 0; i < listaUbicaciones.size(); i++){
            if(listaUbicaciones.get(i).getId().equals(idUbicacion)){
                comboUbi.setSelection(i+1);
            }
        }
    }

    /**
     * En base a la cedula recibida consulta las patologías de la persona
     * y se las asigna en el formulario
     * @param cedula
     */
    public void setearPatologias(String cedula){
        SQLiteDatabase db = conn.getReadableDatabase();
        String consulta = "SELECT "+Utilidades.PATOLOGIA_CAMPO_NOMBRE+"," +
                " P."+Utilidades.PATOLOGIA_CAMPO_ID+" FROM "+
                Utilidades.NOMBRE_TABLA_PATOLOGIA + " AS P" +
                ","+Utilidades.NOMBRE_TABLA_PERSONA_PATOLOGIA+" AS PP" +
                " WHERE "+Utilidades.TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA+"='"+cedula+"'"+
                " AND PP."+Utilidades.TABLA_PERSONA_PATOLOGIA_CAMPO_ID_PATOLOGIA+
                "= P."+Utilidades.PATOLOGIA_CAMPO_ID;
        Cursor cursor = db.rawQuery(consulta,null);
        String patologias = "";
        while(cursor.moveToNext()){
            if(patologias.equals("")){
                patologias = patologias+cursor.getString(0);
            }else{
                patologias = patologias+", "+cursor.getString(0);
            }
            Patologia patologia = new Patologia();
            patologia.setIdPatologia(cursor.getInt(1));
            listaPatologiasContacto.add(patologia);
        }
        this.patologias.setText(patologias);

        db.close();
    }

    /**
     * Consulta todas las patologías y las almacena en un ArrayList
     * para su posterior uso
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
     * Asigna los strings para el spinner de patologías
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
     * Consulta todas las ubicaciones y las almacena en un ArrayList
     * para su posterior uso
     */
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
    /**
     * Asigna los strings para el spinner de ubicaciones
     */
    public void ObtenerListaUbicaciones(){
        listaUbi = new ArrayList<String>();
        listaUbi.add("Seleccione la Ubicación");
        for(int i = 0; i < listaUbicaciones.size(); i++){
            listaUbi.add(listaUbicaciones.get(i).getId()+"-"+listaUbicaciones.get(i).getContinente()+"-"+
                    listaUbicaciones.get(i).getPais()+"-"+listaUbicaciones.get(i).getRegion());
        }
    }

    /**
     * Guarda la patología seleccionada del Spinner de patologias
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
     * En base a la posicion de la patología define si ya ha sido
     * contemplada para esa persona
     * @param posPatologia
     * @return
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

    /**
     * Valida que todos los campos estén correctos y si es así
     * responde true, en caso contrario responde false
     * @return
     * También muestra un mensaje de error en caso de que no sean correctos
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
     * Muestra el calendario para seleccionar fechas
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
     * Cuando se selecciona una fecha se asigna en el EditText
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