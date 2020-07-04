package com.example.cotecapp;

import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager.widget.ViewPager;

import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.widget.Toast;

import com.example.cotecapp.Controlador.TabController;
import com.example.cotecapp.SQLiteTools.ConexionSQLiteHelper;
import com.example.cotecapp.SQLiteTools.Utilidades;
import com.google.android.material.tabs.TabItem;
import com.google.android.material.tabs.TabLayout;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class MainActivity extends AppCompatActivity {
    TabLayout tabLayout;
    ViewPager viewpager;
    TabItem tab1;
    TabItem tab2;
    TabController pageAdapter;
    ConexionSQLiteHelper conn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        conn = new ConexionSQLiteHelper(this, "CoTec", null, 1);
        SQLiteDatabase db = conn.getWritableDatabase();
        /*try {
            cargarBase();
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        tabLayout = findViewById(R.id.tabs);
        viewpager = findViewById(R.id.viewPager);

        tab1 = findViewById(R.id.tabPacientes);
        tab2 = findViewById(R.id.tabContactos);

        pageAdapter = new TabController(getSupportFragmentManager(), tabLayout.getTabCount());
        viewpager.setAdapter(pageAdapter);
        tabLayout.setOnTabSelectedListener(new TabLayout.OnTabSelectedListener(){

            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                viewpager.setCurrentItem(tab.getPosition());
                if(tab.getPosition() == 0){
                    pageAdapter.notifyDataSetChanged();
                }if(tab.getPosition() == 1){
                    pageAdapter.notifyDataSetChanged();
                }
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        });

        viewpager.addOnPageChangeListener(new TabLayout.TabLayoutOnPageChangeListener(tabLayout));
    }

    private void cargarBase() throws IOException {
        StringBuffer buf = new StringBuffer();
        String linea;
        SQLiteDatabase db = conn.getWritableDatabase();
        InputStream is = this.getResources().openRawResource(R.raw.data);
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        if(is!= null){
            while ((linea = reader.readLine())!=null){
                 if(linea.substring(0,1) != ""){
                     db.execSQL(linea);
                 }
            }
        }
        is.close();
    }
}