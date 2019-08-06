package com.java.dao;

import java.util.List;

import com.java.model.Bao;
import com.java.model.Pages;

public interface BaoMapper {
    int Del(Integer id);

    int Add(Bao record);


    Bao GetByID(Integer id);

    int Edit(Bao record);

    List<Bao> Get(Bao n);

	int GetCount(Bao n);
}