package com.java.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.model.*;
import com.java.service.*;
import com.java.utils.PageList;
import com.java.utils.ResponseUtil;

@Controller
@RequestMapping("/board")
public class BoardController {
	private BoardService boardService;

	public BoardService getBoardService() {
		return boardService;
	}

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); // true:允许输入空值，false:不能为空值
	}
	
	@Autowired
	private ClientService clientService;

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;

	
	@RequestMapping("/add")
	public String add(Board n) {
		if(request.getSession().getAttribute("client")==null)
			return Util.SetMap("请先登陆！", false, response);

		Client c=(Client)request.getSession().getAttribute("client");
		try {
			n.setClientId(c.getId());
			int count = boardService.Add(n);

			if(count>0)
				return Util.SetMap("反馈成功！", true, response);
			else
				return Util.SetMap("反馈失败！", false, response);
		} catch (Exception e) {
			return Util.SetMap(e.getMessage(), false, response);
		} 
	}


	
	@RequestMapping("/web_list")
	public String web_list(Board n) {
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(10);//每页显示数量
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		n.setPage(p);
		try {

			List<Board> list = boardService.Get(n);
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request, boardService.GetCount(n), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			System.out.println(request.getQueryString());
			return "board";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	@RequestMapping("/admin_list")
	public String my_list(Board n) {
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(10);//每页显示数量
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		n.setPage(p);
		try {
			List<Board> list = boardService.Get(n);
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request, boardService.GetCount(n), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			System.out.println(request.getQueryString());
			return "admin/board";
		} catch (Exception e) {
			return null;
		}
		
	}

	

	
	
	@RequestMapping(value="/del", method = RequestMethod.POST)
	public String Del(@RequestParam(value = "id") int id) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			System.out.println("================================");
			System.out.println(id);
			//int id=Integer.parseInt(request.getParameter("id"));
			
			int r = boardService.Del(id);
			
			if(r>0)
			{
				map.put("mgf", "删除成功");
				map.put("success", true);
			}
			else
			{
				map.put("mgf", "删除失败");
				map.put("success", false);
			}
		} catch (Exception e) {
			map.put("mgf", "错误："+e.getMessage());
			map.put("success", false);
		} 
		String result = new JSONObject(map).toString();
		ResponseUtil.write(response, result);
		return null;
	}
	
	
}