package com.java.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.*;
import com.java.model.*;
import com.java.service.BaoService;
@Service("BaoService")
public class BaoServiceiml implements BaoService {

	private BaoMapper baoMapper;

	public BaoMapper getAddMapper() {
		return baoMapper;
	}
	@Autowired
	public void setAddMapper(BaoMapper baoMapper) {
		this.baoMapper = baoMapper;
	}
	
	@Override    
	public int Edit(Bao bao) {
		return baoMapper.Edit(bao);
	}
	
	@Override
	public Bao GetByID(int id) {
		return baoMapper.GetByID(id);
	}
	
	@Override
	public int Add(Bao bao) {
		return baoMapper.Add(bao);
	}
	
	@Override
	public int Del(int id) {
		int result = baoMapper.Del(id);
		System.out.println("no:"+result);
		return result;
	}

	@Override
	public List<Bao> Get(Bao n) {
		return baoMapper.Get(n);
	}

	@Override
	public int GetCount(Bao n) {
		return baoMapper.GetCount(n);
	}
}
