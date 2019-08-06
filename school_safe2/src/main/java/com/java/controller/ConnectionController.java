package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.java.model.*;
import com.java.service.*;
import com.java.utils.CommonUtils;
import com.java.utils.ResponseUtil;
import com.java.utils.StringUtil;;

@Controller
@RequestMapping("/connection")
public class ConnectionController {
	private ConnectionService connectionService;

	public ConnectionService getConnectionService() {
		return connectionService;
	}

	@Autowired
	public void setConnectionService(ConnectionService connectionService) {
		this.connectionService = connectionService;
	}
	
	@Autowired
	private NewsService newsService;
	@Autowired
	private ClientService clientService;
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;

	@RequestMapping("/add")
	public String Conn(int id) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			if(request.getSession().getAttribute("client")==null)
			{
				map.put("mgf", "您尚未登陆");
				map.put("success", false);
				String result = new JSONObject(map).toString();
				ResponseUtil.write(response, result);
				return null;
			}
			Client c=(Client)request.getSession().getAttribute("client");
			
			Connection conn=new Connection();
			conn.setClientId(c.getId());
			conn.setNewsId(id);
			if(connectionService.Get(conn).size()==0)
			{
				
				int count = connectionService.Add(conn);
				if(count>0)
				{
					map.put("mgf", "收藏成功");
					map.put("success", true);
				}
				else
				{
					map.put("mgf", "收藏失败");
					map.put("success", false);
				}
			}
			else
			{
				map.put("success", false);
				map.put("mgf", "不能重复收藏");
			}
			String result = new JSONObject(map).toString();
			ResponseUtil.write(response, result);
			return null;
		} catch (Exception e) {
			return null;
		}
	}
	
	

	@RequestMapping("/mylist")
	public String Get(Connection c) {
		Client client=(Client)request.getSession().getAttribute("client");
		c.setClientId(client.getId());
		try {
			List<Connection> list = connectionService.Get(c);
			for(int i=0;i<list.size();i++)
				list.get(i).setNews(newsService.GetByID(list.get(i).getNewsId()));
			System.out.println(list);
			request.setAttribute("list", list);
			return "myconnection";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	
	@SuppressWarnings("finally")
	@RequestMapping(value="/del", method = RequestMethod.POST)
	public String Del(@RequestParam(value = "id") int id) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			System.out.println("================================");
			System.out.println(id);
			//int id=Integer.parseInt(request.getParameter("id"));
			
			int r = connectionService.Del(id);
			
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