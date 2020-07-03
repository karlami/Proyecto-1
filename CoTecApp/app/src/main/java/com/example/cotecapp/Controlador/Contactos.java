package com.example.cotecapp.Controlador;


import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.example.cotecapp.Entidades.Contacto;
import com.example.cotecapp.Entidades.Paciente;
import com.example.cotecapp.InformacionContacto;
import com.example.cotecapp.InformacionPaciente;
import com.example.cotecapp.R;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;

import java.util.ArrayList;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link Pacientes#newInstance} factory method to
 * create an instance of this fragment.
 */
public class Contactos extends Fragment {

    private View Vista;
    private ListView listaContactos;
    private ArrayList<Contacto> listContactos;
    private ArrayList<String> listaContactosDatos;
    private ConexionSQLiteHelper conn;

    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";


    private String mParam1;
    private String mParam2;

    public Contactos() {
        // Required empty public constructor
    }

    public static Pacientes newInstance(String param1, String param2) {
        Pacientes fragment = new Pacientes();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, param1);
        args.putString(ARG_PARAM2, param2);
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
            mParam2 = getArguments().getString(ARG_PARAM2);
        }

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        conn = new ConexionSQLiteHelper(getContext(), "CoTec", null, 1);
        Vista = inflater.inflate(R.layout.fragment_contactos, container, false);
        listaContactos = (ListView) Vista.findViewById(R.id.listaContactos);
        listaContactos.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Contacto contacto = listContactos.get(position);
                Intent intent = new Intent(getContext(), InformacionContacto.class);
                Bundle bundle = new Bundle();
                bundle.putSerializable("contacto", contacto);
                intent.putExtras(bundle);
                startActivity(intent);
            }
        });
        ConsultarListaContactos();
        ArrayAdapter adaptador = new ArrayAdapter(getContext(),
                android.R.layout.simple_list_item_1, listaContactosDatos);
        listaContactos.setAdapter(adaptador);


        return Vista;
    }

    private void ConsultarListaContactos() {
        SQLiteDatabase db = conn.getReadableDatabase();
        Contacto contacto = null;
        listContactos = new ArrayList<Contacto>();

        Cursor cursor = db.rawQuery("SELECT * FROM " + Utilidades.NOMBRE_TABLA_CONTACTO, null);
        while (cursor.moveToNext()){
            contacto = new Contacto();
            contacto.setIdContacto(cursor.getInt(0));
            contacto.setCorreo(cursor.getString(1));
            contacto.setIdPaciente(cursor.getInt(2));
            contacto.setCedula(cursor.getString(3));
            listContactos.add(contacto);
        }
        db.close();
        ObtenerContactos();
    }
    public void ObtenerContactos(){
        SQLiteDatabase db = conn.getReadableDatabase();
        listaContactosDatos = new ArrayList<String>();
        Cursor cursor = null;
        for(int i = 0; i < listContactos.size(); i++){
            cursor = db.rawQuery("SELECT "+Utilidades.PERSONA_CAMPO_NOMBRE +","+
                    Utilidades.PERSONA_CAMPO_PRIMER_APELLIDO +","+
                    Utilidades.PERSONA_CAMPO_SEGUNDO_APELLIDO+" FROM " +
                    Utilidades.NOMBRE_TABLA_PERSONA+" WHERE "+Utilidades.PERSONA_CAMPO_CEDULA+"='"+listContactos.get(i).getCedula()+"'", null);
            cursor.moveToNext();
            listaContactosDatos.add(listContactos.get(i).getCedula()+"-"+
                    cursor.getString(0)+"-"+cursor.getString(1)+"-"+
                    cursor.getString(2));
            cursor.close();
        }
    }
}