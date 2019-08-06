package com.java.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.*;
import com.java.model.*;
import com.java.service.TypeConnectionService;
@Service("TypeConnectionService")
public class TypeConnectionServiceiml implements TypeConnectionService {

	private TypeConnectionMapper typeconnectionMapper;

	public TypeConnectionMapper getAddMapper() {
		return typeconnectionMapper;
	}
	@Autowired
	public void setAddMapper(TypeConnectionMapper typeconnectionMapper) {
		this.typeconnectionMapper = typeconnectionMapper;
	}


	
	@Override
	public int Add(TypeConnection typeconnection) {
		return typeconnectionMapper.Add(typeconnection);
	}
	
	@Override
	public int Del(int id) {
		int result = typeconnectionMapper.Del(id);
		System.out.println("no:"+result);
		return result;
	}

	@Override
	public List<TypeConnection> Get(TypeConnection c) {
		return typeconnectionMapper.Get(c);
	}

}
