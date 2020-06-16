package com.example.cotechospitalario.ui.Gestion_Contactos;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class GestionContacosViewModel extends ViewModel {

    private MutableLiveData<String> mText;

    public GestionContacosViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("This is gallery fragment");
    }

    public LiveData<String> getText() {
        return mText;
    }
}