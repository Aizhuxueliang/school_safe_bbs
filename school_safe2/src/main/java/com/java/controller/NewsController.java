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
import com.java.utils.PageList;
import com.java.utils.ResponseUtil;
import com.java.utils.StringUtil;;

@Controller
@RequestMapping("/news")
public class NewsController {
	private NewsService newsService;

	public NewsService getNewsService() {
		return newsService;
	}

	@Autowired
	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}
	
	@Autowired
	private NewsTypeService newstypeService;
	@Autowired
	private ClientService clientService;
	@Autowired
	private PingLunService pinglunService;
	@Autowired
	private ConnectionService connService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;

	@SuppressWarnings("finally")
	@RequestMapping("/addpage")
	public String add(Model model) {
		try {
			int id=0;
			if(request.getParameter("id")!=null)
				id=Integer.parseInt(request.getParameter("id"));
			model.addAttribute("news", newsService.GetByID(id));
			List<NewsType> nts= newstypeService.Get();
			model.addAttribute("newstype",nts);
		} catch ( Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "addnews";
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("/add")
	@ResponseBody
	public String add(News n) {
		Map<String,Object> map = new HashMap<String,Object>();
		Client c=(Client)request.getSession().getAttribute("client");
		try {
			String id=request.getParameter("id").trim().length()==0?"0":request.getParameter("id");
			n.setId(Integer.parseInt(id));
			if(Integer.parseInt(id)==0&&n.getImg().trim().length()==0)
				n.setImg("images/no.jpg");
			n.setClientId(c.getId());
			int count=0;
			if(n.getId()==0)
				count = newsService.Add(n);
			else
				count=newsService.Edit(n);
			if(count>0)
			{
				map.put("mgf", "操作成功");
				map.put("success", true);
			}
			else
			{
				map.put("mgf", "操作失败");
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

	@RequestMapping("/admin_list")
	public String Get(News n) {
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(3);//每页显示数量
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		try {
			n.setPage(p);
			List<News> list = newsService.Get(n);
			for(int i=0;i<list.size();i++)
				list.get(i).setNewstype(newstypeService.GetByID(list.get(i).getNewstypeId()));
			System.out.println(list);
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request, newsService.GetCount(n), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			return "admin/news";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	@RequestMapping("/web_list")
	public String Get2(News n) {
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(5);//每页显示数量
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		
		n.setPage(p);
		try {
			String title="查询结果";
			if(n.getNewstypeId()>0)
				title=newstypeService.GetByID(n.getNewstypeId()).getType();
			List<News> list = newsService.Get(n);
			for(int i=0;i<list.size();i++)
			{
				String content=StringUtil.CleanHTML(list.get(i).getContent());
				list.get(i).setContent(content);
			}
			System.out.println(list);
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			//分页
			request.setAttribute("pages", PageList.Page(request, newsService.GetCount(n), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			System.out.println(request.getQueryString());
			return "news";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	@RequestMapping("/my_list")
	public String my_list(News n) {
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(5);//每页显示数量
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		n.setPage(p);
		Client c=(Client)request.getSession().getAttribute("client");
		n.setClientId(c.getId());
		try {
			List<News> list = newsService.Get(n);
			for(int i=0;i<list.size();i++)
			{
				String content=StringUtil.CleanHTML(list.get(i).getContent());
				list.get(i).setContent(content);
			}
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request, newsService.GetCount(n), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			System.out.println(request.getQueryString());
			return "mynews";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	@RequestMapping("/show")
	public String GetByID(int id) {
		try {
			News n = newsService.GetByID(id);
			newsService.EditHot(id);
			Client c=clientService.GetByID(n.getClientId());
			n.setClient(c);
			request.setAttribute("news", n);
			PingLun pl=new PingLun();
			pl.setNewsId(id);
			List<PingLun> pin=pinglunService.Get(pl);
			request.setAttribute("pinglun_list", pin);
			return "newsshow";
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping("/zan")
	public String Zan(int id) {
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
			if(request.getSession().getAttribute(String.valueOf(id))==null)
			{
				int count = newsService.EditZan(id);
				if(count>0)
				{
					map.put("mgf", "点赞成功");
					map.put("success", true);
				}
				else
				{
					map.put("mgf", "点赞失败");
					map.put("success", false);
				}
			}
			else
			{
				map.put("success", false);
				map.put("mgf", "您已点过赞");
			}
			request.getSession().setAttribute(String.valueOf(id), id);
			String result = new JSONObject(map).toString();
			ResponseUtil.write(response, result);
			return null;
		} catch (Exception e) {
			return null;
		}
	}
	
	/*@RequestMapping("/conn")
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
			News n = newsService.GetByID(id);
			
			Connection conn=new Connection();
			conn.setClientId(c.getId());
			conn.setNewsId(id);
			if(connService.Get(conn).size()==0)
			{
				
				int count = connService.Add(conn);
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
				map.put("mgf", "您已点过赞");
			}
			request.setAttribute("news", n);
			List<PingLun> pl=pinglunService.GetByNewsID(id);
			request.setAttribute("pinglun_list", pl);
			request.getSession().setAttribute(String.valueOf(id), id);
			String result = new JSONObject(map).toString();
			ResponseUtil.write(response, result);
			return null;
		} catch (Exception e) {
			return null;
		}
	}*/
	
	@RequestMapping(value="/del", method = RequestMethod.POST)
	@ResponseBody
	public String Del(@RequestParam(value = "id") int id) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			System.out.println("================================");
			System.out.println(id);
			//int id=Integer.parseInt(request.getParameter("id"));
			
			int r = newsService.Del(id);
			
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
	
	/**
	 * update status
	 * @return null
	 */
	@RequestMapping("/edit_status")
	@ResponseBody
	public String EditStatus() {
		Map<String,Object> map = new HashMap<String,Object>();
		News n = new News();
		n.setSrc(request.getParameter("stat"));
		int numbers = Integer.parseInt(request.getParameter("numbers"));
		n.setId(numbers);
		int r = newsService.EditStatus(n);
		if(r>0)
		{
			map.put("mgf", "事件状态更新成功！");
			map.put("success", true);
		}
		else
		{
			map.put("mgf", "事件状态更新失败！");
			map.put("success", false);
		}
		String result = new JSONObject(map).toString();
		ResponseUtil.write(response, result);
		return null;
	}
	
	
}