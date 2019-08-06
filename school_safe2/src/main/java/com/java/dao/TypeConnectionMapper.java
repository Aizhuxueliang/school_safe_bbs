package com.java.dao;

import java.util.List;

import com.java.model.Connection;
import com.java.model.TypeConnection;

public interface TypeConnectionMapper {
	int Del(Integer id);

    int Add(TypeConnection record);

    List<TypeConnection> Get(TypeConnection c);
}