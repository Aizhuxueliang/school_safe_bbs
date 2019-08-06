package com.java.dao;

import java.util.List;

import com.java.model.Connection;

public interface ConnectionMapper {
    int Del(Integer id);

    int Add(Connection record);

    List<Connection> Get(Connection c);
}