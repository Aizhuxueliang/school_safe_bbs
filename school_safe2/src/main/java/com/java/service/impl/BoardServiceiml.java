package com.java.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.*;
import com.java.model.*;
import com.java.service.BoardService;
@Service("BoardService")
public class BoardServiceiml implements BoardService {

	private BoardMapper boardMapper;

	public BoardMapper getAddMapper() {
		return boardMapper;
	}
	@Autowired
	public void setAddMapper(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}

	
	@Override
	public Board GetByID(int id) {
		return boardMapper.GetByID(id);
	}
	
	@Override
	public int Add(Board board) {
		return boardMapper.Add(board);
	}
	
	@Override
	public int Del(int id) {
		int result = boardMapper.Del(id);
		System.out.println("no:"+result);
		return result;
	}

	@Override
	public List<Board> Get(Board n) {
		return boardMapper.Get(n);
	}

	@Override
	public int GetCount(Board n) {
		return boardMapper.GetCount(n);
	}
}
