package com.java.service;



import java.util.List;

import com.java.model.*;

public interface AdminService {

	
	public int Add(Admin r);
	public int Edit(Admin r);
	public Admin Login(Admin a);
	public int EditPass(Admin r);
	public Admin GetByID(int id);
	public int Del(int id);
	public List<Admin> Get();
}
