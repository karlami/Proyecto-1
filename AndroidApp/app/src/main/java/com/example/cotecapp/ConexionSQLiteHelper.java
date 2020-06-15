package com.example.cotecapp;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.Nullable;

import com.example.cotecapp.Utilidades.Utilidades;

public class ConexionSQLiteHelper extends SQLiteOpenHelper {
    
    public ConexionSQLiteHelper(@Nullable Context context, @Nullable String name, @Nullable SQLiteDatabase.CursorFactory factory, int version) {
        super(context, name, factory, version);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(Utilidades.TABLA_UBICACION);
        db.execSQL(Utilidades.TABLA_MEDIDA_SANITARIA);
        db.execSQL(Utilidades.TABLA_PATOLOGIA);
        db.execSQL(Utilidades.TABLA_MEDICAMENTO);
        db.execSQL(Utilidades.TABLA_PERSONA);
        db.execSQL(Utilidades.TABLA_CENTRO_HOSPITALARIO);
        db.execSQL(Utilidades.TABLA_CONTACTO);
        db.execSQL(Utilidades.TABLA_PACIENTE);
        db.execSQL(Utilidades.TABLA_PACIENTE_ESTADO);
        db.execSQL(Utilidades.TABLA_PERSONA_PATOLOGIA);
        db.execSQL(Utilidades.TABLA_PACIENTE_MEDICAMENTO);
        db.execSQL(Utilidades.TABLA_UBICACION_MEDIDA_SANITARIA);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_UBICACION);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_MEDIDA_SANITARIA);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_PATOLOGIA);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_MEDICAMENTO);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_PERSONA);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_CENTRO_HOSPITALARIO);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_CONTACTO);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_PACIENTE);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_PACIENTE_ESTADO);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_PERSONA_PATOLOGIA);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_PACIENTE_MEDICAMENTO);
        db.execSQL("DROP TABLE IF EXISTS "+Utilidades.NOMBRE_TABLA_UBICACION_MEDIDA_SANITARIA);
    }
}
