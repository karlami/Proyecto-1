package com.example.cotecapp;

import androidx.appcompat.app.AppCompatActivity;
import androidx.viewpager.widget.ViewPager;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import com.example.cotecapp.Controlador.TabController;
import com.google.android.material.tabs.TabItem;
import com.google.android.material.tabs.TabLayout;
import com.google.android.material.tabs.TabLayout.OnTabSelectedListener;


public class MainActivity extends AppCompatActivity {
    private TabLayout tabLayout;
    private ViewPager viewpager;
    private ListView listaPacientes;
    private TabController pageAdapter;
    private Button addpaciente;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ConexionSQLiteHelper conn = new ConexionSQLiteHelper(this, "Cotec", null, 1);
        listaPacientes = (ListView) findViewById(R.id.listaPacientes);

        tabLayout = findViewById(R.id.tabs);
        viewpager = findViewById(R.id.viewPager);

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

}