package com.example.cotechospitalario.ui.Gestion_Pacientes;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class GestionPacientesViewModel extends ViewModel {

    private MutableLiveData<String> mText;

    public GestionPacientesViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("This is home fragment");
    }

    public LiveData<String> getText() {
        return mText;
    }
}