package com.example.cotecapp;

import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Toast;

import java.util.Calendar;


public class registroPaciente extends AppCompatActivity implements DatePickerDialog.OnDateSetListener {

    private EditText Nombre, Apellido1, Apellido2, Cedula, Nacionalidad, Fecha_Nacimiento, Id_ubicacion,
                     Estado, Internado, UCI, Fecha_Ingreso, Id_Hospital, Id_Medicamento;
    private int dia, mes, ano;
    private Button Registrar, Cancelar;
    private EditText actualFecha;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro_paciente);

        Nombre = findViewById(R.id.Nombre);
        Apellido1 = findViewById(R.id.Apellido1);
        Apellido2 = findViewById(R.id.Apellido2);
        Cedula = findViewById(R.id.Cedula);
        Nacionalidad = findViewById(R.id.Nacionalidad);
        Fecha_Nacimiento = findViewById(R.id.Fecha_N);
        Id_ubicacion = findViewById(R.id.Id_Ubicacion);
        Estado = findViewById(R.id.Estado);
        Internado = findViewById(R.id.Internado);
        UCI = findViewById(R.id.UCI);
        Fecha_Ingreso = findViewById(R.id.Fecha_I);
        Id_Hospital = findViewById(R.id.Id_Hospital);
        Id_Medicamento = findViewById(R.id.Id_Medicamento);

        Registrar = findViewById(R.id.RegistrarBtn);

        Fecha_Ingreso.setInputType(InputType.TYPE_NULL);
        Fecha_Nacimiento.setInputType(InputType.TYPE_NULL);

        Fecha_Nacimiento.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                actualFecha = Fecha_Nacimiento;
                showDatePickerDialog();
            }
        });
        Fecha_Ingreso.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                actualFecha = Fecha_Ingreso;
                showDatePickerDialog();
            }
        });
        Registrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                registrarPaciente();
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
        String date = "month/day/year: " + month + "/" + dayOfMonth + "/" + year;
        actualFecha.setText(date);
    }

    public void registrarPaciente(){
        ConexionSQLiteHelper conn = new ConexionSQLiteHelper(this, "Cotec", null, 1);
        SQLiteDatabase db = conn.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("cedula", Cedula.getText().toString());
        values.put("nombre", Nombre.getText().toString());
        values.put("primerApellido", Apellido1.getText().toString());
        values.put("segundoApellido", Apellido2.getText().toString());
        values.put("fechaNacimiento", Fecha_Nacimiento.getText().toString());
        values.put("nacionalidad", Nacionalidad.getText().toString());
        values.put("idUbicacion", Id_ubicacion.getText().toString());
        values.put("estado", Estado.getText().toString());
        values.put("internado", Internado.getText().toString());
        values.put("uci", UCI.getText().toString());
        values.put("fechaIngreso", Fecha_Ingreso.getText().toString());
        values.put("idCentroHospitalario", Id_Hospital.getText().toString());
        values.put("idMedicamento", Id_Medicamento.getText().toString());

        long idResultante = db.insert("Paciente", "nombre", values);
        Toast.makeText(getApplicationContext(), "Id_Registro: "+ idResultante, Toast.LENGTH_SHORT).show();

    }
    public void volverAlMain(){
        ConexionSQLiteHelper conn = new ConexionSQLiteHelper(this, "Cotec", null, 1);
        SQLiteDatabase db = conn.getReadableDatabase();
        Cursor c = db.rawQuery("SELECT nombre, primerApellido FROM Paciente", null);
        Toast.makeText(getApplicationContext(), c.toString(), Toast.LENGTH_SHORT).show();
       // Intent intent = new Intent(this, MainActivity.class);
       // startActivity(intent);
    }
}