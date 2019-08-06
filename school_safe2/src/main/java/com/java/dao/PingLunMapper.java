package com.java.dao;

import java.util.List;

import com.java.model.PingLun;

public interface PingLunMapper {
    int Del(Integer id);

    int Add(PingLun record);


    PingLun GetByID(Integer id);

    int GetCount(PingLun pl);
    List<PingLun> Get(PingLun pl);
}