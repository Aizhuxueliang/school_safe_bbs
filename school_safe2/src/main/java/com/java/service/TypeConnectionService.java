package com.java.service;



import java.util.List;

import com.java.model.*;

public interface TypeConnectionService {

	public int Add(TypeConnection c);
	public int Del(int id);
	public List<TypeConnection> Get(TypeConnection c);

}
