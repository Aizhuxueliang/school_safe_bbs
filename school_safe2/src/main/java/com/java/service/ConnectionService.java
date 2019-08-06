package com.java.service;



import java.util.List;

import com.java.model.*;

public interface ConnectionService {

	public int Add(Connection c);
	public int Del(int id);
	public List<Connection> Get(Connection c);

}
