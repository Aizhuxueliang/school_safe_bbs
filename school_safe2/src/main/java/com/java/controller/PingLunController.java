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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.java.model.*;
import com.java.service.*;
import com.java.utils.CommonUtils;
import com.java.utils.PageList;
import com.java.utils.ResponseUtil;;

@Controller
@RequestMapping("/pinglun")
public class PingLunController {
	@Autowired
	private PingLunService pinglunService;

	@Autowired
	private NewsService newsService;
	@Autowired
	private ClientService clientService;
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;

	
	@RequestMapping(value="/pinglun_add", method = RequestMethod.POST)
	@ResponseBody
	public String add(PingLun jp) {
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
			System.out.println(jp.getContent());
			Client c=(Client)request.getSession().getAttribute("client");
			jp.setClientId(c.getId());
			jp.setContent(request.getParameter("content"));
			jp.setNewsId(Integer.parseInt(request.getParameter("id")));
			int count = pinglunService.Add(jp);
			if(count>0)
			{
				map.put("mgf", "点评成功");
				map.put("success", true);
			}
			else
			{
				map.put("mgf", "点评失败");
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

	@RequestMapping("/my_list")
	public String GetByClientID() {
		try {
			Client c=(Client)request.getSession().getAttribute("client");
			PingLun p=new PingLun();
			p.setClientId(c.getId());
			List<PingLun> list = pinglunService.Get(p);
			for(int i=0;i<list.size();i++)
			{
				News n=newsService.GetByID(list.get(i).getNewsId());
				list.get(i).setNews(n);;
			}
			System.out.println(list);
			request.setAttribute("list", list);
			return "mypinglun";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	@RequestMapping("/admin_list")
	public String GetByNewsID(PingLun pin) {
		try {
			//分页参数设置
			Pages p=new Pages();
			p.setPagesize(10);//每页显示数量
			int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
			p.setStartindex(startindex);
			
			List<PingLun> list=pinglunService.Get(pin);
			for(int i=0;i<list.size();i++)
			{
				News n=newsService.GetByID(list.get(i).getNewsId());
				list.get(i).setNews(n);;
			}
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request, pinglunService.GetCount(pin), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			return "admin/pinglun";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	
	@SuppressWarnings("finally")
	@RequestMapping(value="/pinglun_del", method = RequestMethod.POST)
	public String Del(@RequestParam(value = "id") int id) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			System.out.println("================================");
			System.out.println(id);
			//int id=Integer.parseInt(request.getParameter("id"));
			
			int r = pinglunService.Del(id);
			
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