package com.java.service;



import java.util.List;

import com.java.model.*;

public interface BoardService {

	public int Add(Board j);
	public Board GetByID(int id);
	public int Del(int id);
	public List<Board> Get(Board n);
	public int GetCount(Board j);
}
