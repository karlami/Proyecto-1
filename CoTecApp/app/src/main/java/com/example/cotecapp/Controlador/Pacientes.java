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

import com.example.cotecapp.Entidades.Medicamento;
import com.example.cotecapp.Entidades.Paciente;
import com.example.cotecapp.InformacionPaciente;
import com.example.cotecapp.MainActivity;
import com.example.cotecapp.R;
import com.example.cotecapp.RegistroPacientes;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;
import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link Pacientes#newInstance} factory method to
 * create an instance of this fragment.
 */
public class Pacientes extends Fragment {

    private FloatingActionButton addPaciente;
    private View Vista;
    private ListView listaPacientes;
    private ArrayList<Paciente> listPacientes;
    private ArrayList<String> listaPacientesDatos;
    private ConexionSQLiteHelper conn;

    private static final String ARG_PARAM1 = "param1";
    private static final String ARG_PARAM2 = "param2";


    private String mParam1;
    private String mParam2;

    public Pacientes() {
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
        Vista = inflater.inflate(R.layout.fragment_pacientes, container, false);
        addPaciente = (FloatingActionButton) Vista.findViewById(R.id.addPaciente);
        listaPacientes = (ListView) Vista.findViewById(R.id.listaPacientes);
        listaPacientes.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Paciente paciente = listPacientes.get(position);
                Intent intent = new Intent(getContext(), InformacionPaciente.class);
                Bundle bundle = new Bundle();
                bundle.putSerializable("paciente", paciente);
                intent.putExtras(bundle);
                startActivity(intent);
            }
        });
        ConsultarListaPacientes();
        ArrayAdapter adaptador = new ArrayAdapter(getContext(),
                android.R.layout.simple_list_item_1, listaPacientesDatos);
        listaPacientes.setAdapter(adaptador);

        addPaciente.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), RegistroPacientes.class);
                getActivity().startActivity(intent);
            }
        });

        return Vista;
    }

    private void ConsultarListaPacientes() {
        SQLiteDatabase db = conn.getReadableDatabase();
        Paciente paciente = null;
        listPacientes = new ArrayList<Paciente>();

        Cursor cursor = db.rawQuery("SELECT * FROM " + Utilidades.NOMBRE_TABLA_PACIENTE, null);
        while (cursor.moveToNext()){
            paciente = new Paciente();
            paciente.setIdPaciente(cursor.getInt(0));
            paciente.setInternado(cursor.getInt(1));
            paciente.setUci(cursor.getInt(2));
            paciente.setFechaIngreso(cursor.getString(3));
            paciente.setIdCentroHospitalario(cursor.getInt(4));
            paciente.setCedula(cursor.getString(5));
            listPacientes.add(paciente);
        }
        db.close();
        ObtenerPacientes();
    }
    public void ObtenerPacientes(){
        SQLiteDatabase db = conn.getReadableDatabase();
        listaPacientesDatos = new ArrayList<String>();
        Cursor cursor = null;
        for(int i = 0; i < listPacientes.size(); i++){
            cursor = db.rawQuery("SELECT "+Utilidades.PERSONA_CAMPO_NOMBRE +","+
                    Utilidades.PERSONA_CAMPO_PRIMER_APELLIDO +","+
                    Utilidades.PERSONA_CAMPO_SEGUNDO_APELLIDO+" FROM " +
                    Utilidades.NOMBRE_TABLA_PERSONA+" WHERE "+Utilidades.PERSONA_CAMPO_CEDULA+"='"+listPacientes.get(i).getCedula()+"'", null);
            cursor.moveToNext();
            listaPacientesDatos.add(listPacientes.get(i).getCedula()+"-"+
                    cursor.getString(0)+"-"+cursor.getString(1)+"-"+
                    cursor.getString(2));
            cursor.close();
        }
    }
}