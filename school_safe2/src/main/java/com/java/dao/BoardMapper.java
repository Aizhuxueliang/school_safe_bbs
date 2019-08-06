package com.java.dao;

import java.util.List;

import com.java.model.Board;
import com.java.model.Pages;

public interface BoardMapper {
    int Del(Integer id);

    int Add(Board record);


    Board GetByID(Integer id);


    List<Board> Get(Board n);

	int GetCount(Board n);
}