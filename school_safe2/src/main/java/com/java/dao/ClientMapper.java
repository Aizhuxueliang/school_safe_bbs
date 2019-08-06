package com.java.dao;

import java.util.List;

import com.java.model.*;

public interface ClientMapper {

	int Add(Client client);
	int Edit(Client client);
	int Del(int id);
	Client GetByID(int id);
	List<Client> Get(Client c);
	Client Login(String login);
	int EditPass(Client client);
	int GetCount(Client client);
}