package com.example.cotecapp.Controlador;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

public class TabController extends FragmentPagerAdapter
{
    int tabsNum;

    public TabController(@NonNull FragmentManager fm, int behavior) {
        super(fm, behavior);
        this.tabsNum = behavior;
    }

    @NonNull
    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                return new Pacientes();
            case 1:
                return new Contactos();
            default:
                return null;
        }
    }

    @Override
    public int getCount() {
        return tabsNum;
    }
}