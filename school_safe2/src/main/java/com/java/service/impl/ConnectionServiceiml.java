package com.java.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.*;
import com.java.model.*;
import com.java.service.ConnectionService;
@Service("ConnectionService")
public class ConnectionServiceiml implements ConnectionService {

	private ConnectionMapper connectionMapper;

	public ConnectionMapper getAddMapper() {
		return connectionMapper;
	}
	@Autowired
	public void setAddMapper(ConnectionMapper connectionMapper) {
		this.connectionMapper = connectionMapper;
	}


	
	@Override
	public int Add(Connection connection) {
		return connectionMapper.Add(connection);
	}
	
	@Override
	public int Del(int id) {
		int result = connectionMapper.Del(id);
		System.out.println("no:"+result);
		return result;
	}

	@Override
	public List<Connection> Get(Connection c) {
		return connectionMapper.Get(c);
	}

}
