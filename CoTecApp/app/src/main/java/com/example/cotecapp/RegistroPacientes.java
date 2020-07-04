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
import android.widget.CheckBox;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.cotecapp.Entidades.Estado;
import com.example.cotecapp.Entidades.Hospital;
import com.example.cotecapp.Entidades.Medicamento;
import com.example.cotecapp.Entidades.Patologia;
import com.example.cotecapp.Entidades.Ubicacion;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;

import java.util.ArrayList;
import java.util.Calendar;


public class RegistroPacientes extends AppCompatActivity implements DatePickerDialog.OnDateSetListener {
    private Spinner EstadoCombo, comboUbicacion, idHospitalCombo, Id_Medicamento_Combo, comboPatologia;
    ArrayList<Ubicacion> listaUbicaciones;
    ArrayList<Hospital> listaHospitales;
    ArrayList<Estado> listaEstados;
    ArrayList<String> listaHospi, listMedi, listaUbi, PatologiasData, EstadosData;
    ArrayList<Medicamento> listaMedicamentos;
    ArrayList<Medicamento> listaMedicamentosPaciente;
    ConexionSQLiteHelper conn;
    CheckBox UCI, Internado;
    ArrayList<Patologia> listaPatologias, listaPatologiasPaciente;

    private Utilidades U;
    private EditText Nombre, Apellido1, Apellido2, Cedula, Nacionalidad, Fecha_Nacimiento,
             patologia, FechaIngreso, actualFecha, medicamentosPaciente;
    private int dia, mes, ano;
    private Button BorrarMedicamentos, GuardarMedicamento, Registrar,
            Cancelar, seleccionarFechaIngreso, seleccionarFechaNacimiento,
            GuardarPatologia, BorrarPatologia;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro_pacientes);
        conn = new ConexionSQLiteHelper(this, "CoTec", null, 1);
        listaMedicamentosPaciente = new ArrayList<>();
        listaPatologiasPaciente = new ArrayList<>();
        U = new Utilidades();
        GuardarPatologia = findViewById(R.id.GuardarPatologia);
        GuardarPatologia.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                GuadarPatologia();
            }
        });
        BorrarPatologia = findViewById(R.id.BorrarPatologia);
        BorrarPatologia.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listaPatologiasPaciente = new ArrayList<>();
                patologia.setText("");
            }
        });
        seleccionarFechaNacimiento = findViewById(R.id.seleccionarFechaNaci);
        seleccionarFechaIngreso = findViewById(R.id.seleccionarFechaIngreso);
        Nombre = findViewById(R.id.Nombre);
        Apellido1 = findViewById(R.id.Apellido1);
        Apellido2 = findViewById(R.id.Apellido2);
        Cedula = findViewById(R.id.Cedula);
        Nacionalidad = findViewById(R.id.Nacionalidad);
        Fecha_Nacimiento = findViewById(R.id.Fecha_N);
        EstadoCombo = findViewById(R.id.Estado);

        ConsultarEstados();
        ArrayAdapter<CharSequence> adaptadorE = new ArrayAdapter(this,
                R.layout.spinner, EstadosData);
        EstadoCombo.setAdapter(adaptadorE);

        Internado = findViewById(R.id.Internado);
        UCI = findViewById(R.id.UCI);
        FechaIngreso = findViewById(R.id.Fecha_I);
        Id_Medicamento_Combo = findViewById(R.id.Id_Medicamento);
        patologia = findViewById(R.id.Patologias);
        idHospitalCombo = findViewById(R.id.idCentroHospitalario);
        BorrarMedicamentos = findViewById(R.id.BorrarMedicamentos);

        medicamentosPaciente = findViewById(R.id.MedicamentosPaciente);
        GuardarMedicamento = findViewById(R.id.GuardarMedicamento);
        BorrarMedicamentos.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                listaMedicamentosPaciente = new ArrayList<>();
                medicamentosPaciente.setText("");
            }
        });
        GuardarMedicamento.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Guadarmedicamento();
            }
        });

        ConsultarUbicaciones();
        comboUbicacion = (Spinner) findViewById(R.id.ubicacionCombo);
        ArrayAdapter<CharSequence> adaptadorU = new ArrayAdapter(this,
                R.layout.spinner, listaUbi);
        comboUbicacion.setAdapter(adaptadorU);

        ConsultarPatologias();
        comboPatologia = (Spinner) findViewById(R.id.PatologiasSpin);
        ArrayAdapter<CharSequence> adaptadorP = new ArrayAdapter(this,
                R.layout.spinner, PatologiasData);
        comboPatologia.setAdapter(adaptadorP);

        ConsultarHospitales();
        idHospitalCombo = (Spinner) findViewById(R.id.idCentroHospitalario);
        ArrayAdapter<CharSequence> adaptadorH = new ArrayAdapter(this,
                R.layout.spinner, listaHospi);
        idHospitalCombo.setAdapter(adaptadorH);

        Fecha_Nacimiento.setInputType(InputType.TYPE_NULL);
        FechaIngreso.setInputType(InputType.TYPE_NULL);
        patologia.setInputType(InputType.TYPE_NULL);
        medicamentosPaciente.setInputType(InputType.TYPE_NULL);

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
    public void ConsultarEstados(){
        listaEstados = new ArrayList<>();
        SQLiteDatabase db = conn.getWritableDatabase();
        String consultaPa = "SELECT * FROM "+U.NOMBRE_TABLA_ESTADO_PACIENTE;
        Cursor cursor = db.rawQuery(consultaPa, null);
        while (cursor.moveToNext()){
            Estado estado = new Estado();
            estado.setIdEstado(cursor.getInt(0));
            estado.setEstado(cursor.getString(1));
            listaEstados.add(estado);
        }
        db.close();
        obtenerListaEstados();
    }

    public void obtenerListaEstados(){
        EstadosData = new ArrayList<>();
        EstadosData.add("Estado");
        for(int i = 0; i < listaEstados.size(); i++){
            Estado estado = listaEstados.get(i);
            String Estado = estado.getEstado();
            EstadosData.add(Estado);
        }
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

    public void GuadarPatologia(){
        int pospatologia = comboPatologia.getSelectedItemPosition() - 1;
        if(pospatologia >= 0){
            if(!ComprobarPatologia(pospatologia)){
                Patologia patologiapaciente = listaPatologias.get(pospatologia);
                String patologias = patologia.getText().toString();
                listaPatologiasPaciente.add(patologiapaciente);
                if(patologias.equals("")){
                    patologias = patologiapaciente.getNombre();
                }else{
                    patologias = patologias +", "+patologiapaciente.getNombre();
                }
                patologia.setText(patologias);
            }
        }else{
            Context context = getApplicationContext();
            CharSequence text = "Seleccione la patología que desea agregar.";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
    }
    public void Guadarmedicamento(){
        int posMedicamento = Id_Medicamento_Combo.getSelectedItemPosition() - 1;
        if(posMedicamento >= 0){
            if(!ComprobarMedicamento(posMedicamento)){
                Medicamento medicamento = listaMedicamentos.get(posMedicamento);
                String medicamentos = medicamentosPaciente.getText().toString();
                listaMedicamentosPaciente.add(medicamento);
                if(medicamentos.equals("")){
                    medicamentos = medicamento.getNombre();
                }else{
                    medicamentos = medicamentos +", "+medicamento.getNombre();
                }
                medicamentosPaciente.setText(medicamentos);
            }
        }else{
            Context context = getApplicationContext();
            CharSequence text = "Seleccione el medicamento que desea agregar.";
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
        for(int i = 0; i < listaPatologiasPaciente.size(); i++){
            int idPatologia = listaPatologiasPaciente.get(i).getIdPatologia();
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
     * Comprueba que el medicamento que se va a guardar no esté asignada ya
     * @param posMedicamento se usa para identificar la posición del medicamento en la lista
     * @return true si la encuentra en la lista y false si no la encuentra
     */
    public boolean ComprobarMedicamento(int posMedicamento){
        for(int i = 0; i < listaMedicamentosPaciente.size(); i++){
            int idMedicamento = listaMedicamentosPaciente.get(i).getIdMedicamento();
            if(idMedicamento == listaMedicamentos.get(posMedicamento).getIdMedicamento()){
                Context context = getApplicationContext();
                CharSequence text = "Este medicamento ya ha sido agregado.";
                int duration = Toast.LENGTH_SHORT;
                Toast toast = Toast.makeText(context, text, duration);
                toast.show();
                return true;
            }
        }
        return false;
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
        actualFecha.setText(date);
    }

    public void EjecutarRegistro(){
        if(validarCampos()){
            registrarPaciente();
        }
    }
    public void registrarPaciente(){
        String internadoCheck = "'false'";
        String uciCheck = "'false'";
        if(Internado.isChecked()){
            internadoCheck = "'true'";
        }
        if(UCI.isChecked()){
            uciCheck = "'true'";
        }

        SQLiteDatabase db = conn.getWritableDatabase();
        int posidUbi = comboUbicacion.getSelectedItemPosition() - 1;
        String idUbi = listaUbicaciones.get(posidUbi).getId().toString();
        int posIdHospi = idHospitalCombo.getSelectedItemPosition() - 1;
        String IdHospi = listaHospitales.get(posIdHospi).getIdCentroHospitalario().toString();

        String selectPersona = "SELECT * FROM "+U.NOMBRE_TABLA_PERSONA+" " +
                "WHERE "+U.PERSONA_CAMPO_CEDULA+"='"+Cedula.getText()+"'";
        Cursor cursor = db.rawQuery(selectPersona, null);
        if(!cursor.moveToFirst()){
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
            agregarPatologias();
        }else{
            Context context = getApplicationContext();
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, "Esta persona ya está registrado.", duration);
            toast.show();
        }
        String selectPaciente = "SELECT * FROM "+U.NOMBRE_TABLA_PACIENTE+" " +
                "WHERE "+U.TABLA_PACIENTE_CAMPO_CEDULA+"='"+Cedula.getText()+"'";
        cursor = db.rawQuery(selectPaciente, null);
        if(!cursor.moveToFirst()){
            int posEstado = EstadoCombo.getSelectedItemPosition() - 1;
            String InsertPaciente = "INSERT INTO "+U.NOMBRE_TABLA_PACIENTE+"("+
                    U.TABLA_PACIENTE_CAMPO_INTERNADO+","+U.TABLA_PACIENTE_CAMPO_UCI+","+
                    U.TABLA_PACIENTE_CAMPO_FECHA_INGRES+","+
                    U.TABLA_PACIENTE_CAMPO_ID_ESTADO_PACIENTE+","+
                    U.TABLA_PACIENTE_CAMPO_ID_CENTRO_HOSPI+","+
                    U.TABLA_PACIENTE_CAMPO_CEDULA+") " +
                    "VALUES ("+internadoCheck+","+uciCheck+"," +
                    "'"+FechaIngreso.getText().toString()+"',"+listaEstados.get(posEstado).getIdEstado()+", "+IdHospi+", '"+
                    Cedula.getText().toString()+"');";
            db.execSQL(InsertPaciente);
            Cursor c = db.rawQuery("SELECT * FROM "+U.NOMBRE_TABLA_PACIENTE+" WHERE "+
                    U.TABLA_PACIENTE_CAMPO_CEDULA+" = '"+Cedula.getText().toString()+"' ", null);
            c.moveToFirst();
            String idPaciente = c.getString(0);

            agregarMedicamentos(idPaciente);
            db.close();
            Intent intent = new Intent(this, MainActivity.class);
            startActivity(intent);
        }else{
            Context context = getApplicationContext();
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, "Este paciente ya existe.", duration);
            toast.show();
        }
    }

    public void agregarPatologias(){
        SQLiteDatabase db = conn.getWritableDatabase();
        for(int i = 0; i < listaPatologiasPaciente.size(); i++){
            Patologia patologia = listaPatologiasPaciente.get(i);
            String personaPatologia = "INSERT INTO "+U.NOMBRE_TABLA_PERSONA_PATOLOGIA+"(" +
                    " "+U.TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA+","+
                    U.TABLA_PERSONA_PATOLOGIA_CAMPO_ID_PATOLOGIA+") VALUES" +
                    "('"+Cedula.getText().toString()+"', "+patologia.getIdPatologia()+")";
            db.execSQL(personaPatologia);
        }
        db.close();
    }

    public void agregarMedicamentos(String idPaciente){
        SQLiteDatabase db = conn.getWritableDatabase();
        for(int i = 0; i < listaMedicamentosPaciente.size(); i++){
            String idMedicamento = listaMedicamentosPaciente.get(i).getIdMedicamento().toString();
            String pacienteMedicamento = "INSERT INTO "+U.NOMBRE_TABLA_PACIENTE_MEDICAMENTO+"" +
                    "("+U.PACIENTE_MEDICAMENTO_CAMPO_ID_MEDICAMENTO+", "+U.PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE+
                    ") VALUES("+idMedicamento+", "+idPaciente+")";
            db.execSQL(pacienteMedicamento);
        }

    }

    public void volverAlMain(){
         Intent intent = new Intent(this, MainActivity.class);
         startActivity(intent);
    }
    /**
     * Valida que los campos hayan sido completados de manera correcta
     * @return true si son validos todos los campos y false
     * si no se cumple al menos 1
     */
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
        if(EstadoCombo.getSelectedItemPosition() == 0){
            Context context = getApplicationContext();
            CharSequence text = "Seleccione un Estado";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
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