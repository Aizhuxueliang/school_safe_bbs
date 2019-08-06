package com.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.java.model.*;
import com.java.service.*;
import com.java.utils.CommonUtils;
import com.java.utils.PageList;
import com.java.utils.StringUtil;

@Controller
/*@RequestMapping("/line")*/
public class indexController {
	@Autowired
	private IntroduceService introduceService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private NewsTypeService newstypeService;
	
	@Autowired
	private HttpServletRequest request;

	/**
	 * 用户首页
	 * @return
	 */
	@RequestMapping(value = "/index")
	public String index(Model model,News n){
		Pages p=new Pages();
		p.setPagesize(5);
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		n.setPage(p);
		List<News> news = newsService.Get(n);
		for(int i=0;i<news.size();i++)
		{
			String content=StringUtil.CleanHTML(news.get(i).getContent());
			news.get(i).setContent(content);
		}
		Introduce intr = introduceService.GetByID(1);
		List<NewsType> nt = newstypeService.Get();
		model.addAttribute("news", news);
		model.addAttribute("intr", intr);
		model.addAttribute("newstype", nt);
		
		request.getSession().setAttribute("menu", nt);
		request.setAttribute("pages", PageList.Page(request, newsService.GetCount(n), 
				p.getPagesize(), p.getStartindex(),request.getQueryString()));
		System.out.println(request.getQueryString());
		return "index";
		
	}
	
	@RequestMapping(value = "/badge")
	public String service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		int getTotal = newsService.GetTotals();
		StringBuffer json = null;
			//数据发生改变 将数据响应客户端
		json = new StringBuffer("{");
		json.append("\"msgNum\":"+getTotal);
		json.append("}");
		out.write(json.toString());
		return "top";
	}

}