package com.example.cotecapp.Controlador;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

/**
 * Controlador de las TabLayout donde se muestran las
 * pestañas Contactos y Pacientes
 */
public class TabController extends FragmentPagerAdapter
{
    int tabsNum;

    public TabController(@NonNull FragmentManager fm, int behavior) {
        super(fm, behavior);
        this.tabsNum = behavior;
    }

    /**
     * Selecciona la vista a mostrar respecto a la posición de las
     * pestañas.
     * @param position
     * @return
     */
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