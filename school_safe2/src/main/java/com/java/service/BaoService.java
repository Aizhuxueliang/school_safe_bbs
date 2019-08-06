package com.java.service;



import java.util.List;

import com.java.model.*;

public interface BaoService {

	public int Add(Bao j);
	public int Edit(Bao j);
	public Bao GetByID(int id);
	public int Del(int id);
	public List<Bao> Get(Bao n);
	public int GetCount(Bao j);
}
