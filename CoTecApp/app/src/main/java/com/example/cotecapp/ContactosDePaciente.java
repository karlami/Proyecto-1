package com.example.cotecapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import com.example.cotecapp.Entidades.Contacto;
import com.example.cotecapp.Entidades.Paciente;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;
import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;

public class ContactosDePaciente extends AppCompatActivity {
    private FloatingActionButton addContacto;
    private ListView listaContactos;
    private ArrayList<Contacto> listContactos;
    private ArrayList<String> listaContactosDatos;
    private ConexionSQLiteHelper conn;
    private Context context;
    private Paciente PacienteActual;
    private Utilidades U;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contactos_pacientes);
        context = this;
        addContacto = (FloatingActionButton) findViewById(R.id.addContacto);
        listaContactos = (ListView) findViewById(R.id.listaContactos);
        conn = new ConexionSQLiteHelper(this, "CoTec", null, 1);
        U = new Utilidades();
        listContactos = new ArrayList<Contacto>();
        listaContactos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Contacto contacto = listContactos.get(position);
                Intent intent = new Intent(context, InformacionContacto.class);
                Bundle bundle = new Bundle();
                bundle.putSerializable("contacto", contacto);
                intent.putExtras(bundle);
                startActivity(intent);
            }
        });
        Bundle pacienteRecibido = getIntent().getExtras();
        if(pacienteRecibido != null){
            Paciente paciente = (Paciente) pacienteRecibido.getSerializable("paciente");
            PacienteActual = paciente;
            ConsultarListaContactos();
        }
        ArrayAdapter adaptador = new ArrayAdapter(context,
                android.R.layout.simple_list_item_1, listaContactosDatos);
        listaContactos.setAdapter(adaptador);

        addContacto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context, RegistroContacto.class);
                Bundle bundle = new Bundle();
                bundle.putSerializable("paciente", PacienteActual);
                intent.putExtras(bundle);
                startActivity(intent);
            }
        });
    }

    /**
     * Consulta la lista de contactos de un paciente recibido
     */
    private void ConsultarListaContactos() {

        SQLiteDatabase db = conn.getReadableDatabase();
        String consultaContactos = "SELECT * FROM "+U.NOMBRE_TABLA_CONTACTO+" WHERE "+
                U.TABLA_CONTACTO_CAMPO_ID_PACIENTE+ "="+PacienteActual.getIdPaciente();
        Cursor cursor = db.rawQuery(consultaContactos,null);
        while(cursor.moveToNext()){
            Contacto contacto = new Contacto();
            contacto.setIdContacto(cursor.getInt(0));
            contacto.setCorreo(cursor.getString(1));
            contacto.setIdPaciente(cursor.getInt(2));
            contacto.setCedula(cursor.getString(3));
            listContactos.add(contacto);
        }

        db.close();
        ObtenerListaContactos();
    }

    /**
     * Obtiene los string que se van a agregar al ListView
     */
    private void ObtenerListaContactos() {
        SQLiteDatabase db = conn.getReadableDatabase();
        listaContactosDatos = new ArrayList<String>();
        for (int i = 0; i < listContactos.size(); i++){
            Contacto cont = listContactos.get(i);
            String consulta = "SELECT "+Utilidades.PERSONA_CAMPO_NOMBRE+", "+U.PERSONA_CAMPO_PRIMER_APELLIDO+" FROM "+
                    Utilidades.NOMBRE_TABLA_PERSONA+" WHERE "+Utilidades.PERSONA_CAMPO_CEDULA+
                    " = '"+cont.getCedula()+"'";
            Cursor cursor = null;
            cursor = db.rawQuery(consulta, null);
            cursor.moveToFirst();

            if(cursor != null){
                String data = cont.getCedula()+" - "+cursor.getString(0)+
                        " - "+ cursor.getString(1);
                listaContactosDatos.add(data);
            }

        }
    }
}