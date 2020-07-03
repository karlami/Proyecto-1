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
import com.example.cotecapp.Entidades.Paciente;
import com.example.cotecapp.Entidades.Patologia;
import com.example.cotecapp.Entidades.Persona;
import com.example.cotecapp.Entidades.Ubicacion;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;

import java.util.ArrayList;
import java.util.Calendar;


public class ActualizarPaciente extends AppCompatActivity implements DatePickerDialog.OnDateSetListener {
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
    private Button BorrarMedicamentos, GuardarMedicamento, GuardarCambios,
            Cancelar, seleccionarFechaIngreso, seleccionarFechaNacimiento,
            GuardarPatologia, BorrarPatologia;
    private Paciente PacienteActual;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_actualizar_paciente);
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

        ConsultarMedicamentos();
        Id_Medicamento_Combo = (Spinner) findViewById(R.id.Id_Medicamento);
        ArrayAdapter<CharSequence> adaptadorM = new ArrayAdapter(this,
                R.layout.spinner, listMedi);
        Id_Medicamento_Combo.setAdapter(adaptadorM);
        Cedula.setInputType(InputType.TYPE_NULL);

        GuardarCambios = findViewById(R.id.RegistrarBtn);
        Fecha_Nacimiento.setInputType(InputType.TYPE_NULL);
        FechaIngreso.setInputType(InputType.TYPE_NULL);
        patologia.setInputType(InputType.TYPE_NULL);
        medicamentosPaciente.setInputType(InputType.TYPE_NULL);


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
        GuardarCambios.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EjecutarUpdate();
                Intent intent = new Intent(getApplicationContext(), InformacionPaciente.class);
                Bundle bundle = new Bundle();
                bundle.putSerializable("paciente", PacienteActual);
                intent.putExtras(bundle);
                startActivity(intent);;
            }
        });
        findViewById(R.id.CancelarRegistro).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                volverAlMain();
            }
        });
        Bundle pacienteRecibido = getIntent().getExtras();
        if(pacienteRecibido != null){
            Persona persona = (Persona) pacienteRecibido.get("persona");
            Paciente paciente = (Paciente) pacienteRecibido.get("paciente");
            PacienteActual = paciente;
            Nombre.setText(persona.getNombre());
            Apellido1.setText(persona.getPrimerApellido());
            Apellido2.setText(persona.getSegundoApellido());
            Cedula.setText(persona.getCedula());
            Fecha_Nacimiento.setText(persona.getFechaNacimiento());
            Nacionalidad.setText(persona.getNacionalidad());
            FechaIngreso.setText(paciente.getFechaIngreso());
            if(paciente.getUci().equals("true")){
                UCI.setChecked(true);
            }else{
                UCI.setChecked(false);
            }
            if(paciente.getInternado().equals("true")){
                Internado.setChecked(true);
            }else{
                Internado.setChecked(false);
            }
            setearEstado(paciente.getIdEstado());
            setearHospital(paciente.getIdCentroHospitalario());
            setearUbicacion(persona.getIdUbicacion());
            setearPatologias(persona.getCedula());
            setearMedicacion(paciente.getIdPaciente());
        }

    }
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
            listaPatologiasPaciente.add(patologia);
        }
        this.patologia.setText(patologias);

        db.close();
    }
    public void setearMedicacion(Integer idPaciente){
        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaMedicamento = "SELECT "+Utilidades.MEDICAMENTO_CAMPO_NOMBRE+", " +
                " M."+Utilidades.MEDICAMENTO_CAMPO_ID_MEDICAMENTO+" FROM "+
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
            medicamento.setIdMedicamento(cursor.getInt(1));
            listaMedicamentosPaciente.add(medicamento);
        }
        medicamentosPaciente.setText(medicamentos);
        db.close();
    }
    public void setearEstado(Integer idEstado){
        for(int i = 0; i < listaEstados.size(); i++){
            if(listaEstados.get(i).getIdEstado().equals(idEstado)){
                EstadoCombo.setSelection(i+1);
            }
        }
    }
    public void setearHospital(Integer idHospi){
        for(int i = 0; i < listaHospitales.size(); i++){
            if(listaHospitales.get(i).getIdCentroHospitalario().equals(idHospi)){
                idHospitalCombo.setSelection(i+1);
            }
        }
    }
    public void setearUbicacion(Integer idUbicacion){
        for(int i = 0; i < listaUbicaciones.size(); i++){
            if(listaUbicaciones.get(i).getId().equals(idUbicacion)){
                comboUbicacion.setSelection(i+1);
            }
        }
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

    public void EjecutarUpdate(){
        if(validarCampos()){
            actualizarPaciente();
        }
    }
    public void actualizarPaciente(){
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

        String updatePersona = "UPDATE "+U.NOMBRE_TABLA_PERSONA+" "+
                "SET "+U.PERSONA_CAMPO_CEDULA+"='"+Cedula.getText().toString()+"',"
                +U.PERSONA_CAMPO_NOMBRE+"='"+Nombre.getText().toString()+"',"
                +U.PERSONA_CAMPO_PRIMER_APELLIDO+"='"+Apellido1.getText().toString()+"',"
                +U.PERSONA_CAMPO_SEGUNDO_APELLIDO+"='"+Apellido2.getText().toString()+"',"
                +U.PERSONA_CAMPO_NACIONALIDAD+"='"+Nacionalidad.getText().toString()+"',"
                +U.PERSONA_CAMPO_FECHA_NACIMIENTO+"='"+Fecha_Nacimiento.getText().toString()+"',"
                +U.PERSONA_CAMPO_ID_UBICACION+"="+idUbi+
                " WHERE "+U.PERSONA_CAMPO_CEDULA+"='"+Cedula.getText().toString()+"'";
        db.execSQL(updatePersona);
        int posEstado = EstadoCombo.getSelectedItemPosition() - 1;

        String UpdatePaciente = "UPDATE "+U.NOMBRE_TABLA_PACIENTE+"" +
                " SET "+U.TABLA_PACIENTE_CAMPO_INTERNADO+"="+internadoCheck+","+
                U.TABLA_PACIENTE_CAMPO_UCI+"="+uciCheck+","+
                U.TABLA_PACIENTE_CAMPO_FECHA_INGRES+"='"+FechaIngreso.getText().toString()+"',"+
                U.TABLA_PACIENTE_CAMPO_ID_ESTADO_PACIENTE+"="+listaEstados.get(posEstado).getIdEstado()+","+
                U.TABLA_PACIENTE_CAMPO_ID_CENTRO_HOSPI+"="+IdHospi+","+
                U.TABLA_PACIENTE_CAMPO_CEDULA+"='"+Cedula.getText().toString()+"' "+"" +
                "WHERE "+U.TABLA_PACIENTE_CAMPO_ID_PACIENTE+"="+PacienteActual.getIdPaciente();
        db.execSQL(UpdatePaciente);

        String idPaciente = PacienteActual.getIdPaciente().toString();


        borrarPatologiasMedicamentos(PacienteActual.getIdPaciente());
        agregarPatologias();
        agregarMedicamentos(idPaciente);

        db.close();
    }
    public void borrarPatologiasMedicamentos(Integer idPaciente){
        String deletePatologias = "DELETE FROM "+U.NOMBRE_TABLA_PERSONA_PATOLOGIA
                +" WHERE "+U.TABLA_PERSONA_PATOLOGIA_CAMPO_CEDULA+"='"
                +Cedula.getText()+"'";
        String deleteMedicacion = "DELETE FROM "+U.NOMBRE_TABLA_PACIENTE_MEDICAMENTO
                +" WHERE "+U.PACIENTE_MEDICAMENTO_CAMPO_ID_PACIENTE+"="
                +idPaciente;
        SQLiteDatabase db = conn.getWritableDatabase();
        db.execSQL(deleteMedicacion);
        db.execSQL(deletePatologias);
        db.close();
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