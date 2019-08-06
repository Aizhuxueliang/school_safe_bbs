package com.java.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
@RequestMapping("/bao")
public class BaoController {
	private BaoService baoService;

	public BaoService getBaoService() {
		return baoService;
	}

	@Autowired
	public void setBaoService(BaoService baoService) {
		this.baoService = baoService;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); // true:允许输入空值，false:不能为空值
	}
	
	@Autowired
	private AdminService adminService;
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
			model.addAttribute("bao", baoService.GetByID(id));
		} catch ( Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/addbao";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public String add(Bao n) {
		Map<String,Object> map = new HashMap<String,Object>();
		Admin a=(Admin)request.getSession().getAttribute("admin");
		try {
			String id=request.getParameter("id").trim().length()==0?"0":request.getParameter("id");
			n.setId(Integer.parseInt(id));
			n.setAdminId(a.getId());
			int count=0;
			if(n.getId()==0)
				count = baoService.Add(n);
			else
				count=baoService.Edit(n);
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


	
	@RequestMapping("/web_list")
	public String Get2(Bao n) {
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(10);//每页显示数量
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		n.setPage(p);
		try {

			List<Bao> list = baoService.Get(n);
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request, baoService.GetCount(n), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			System.out.println(request.getQueryString());
			return "bao";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	@RequestMapping("/admin_list")
	public String my_list(Bao n) {
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(10);//每页显示数量
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		n.setPage(p);
		Admin a=(Admin)request.getSession().getAttribute("admin");
		n.setAdminId(a.getId());
		try {
			List<Bao> list = baoService.Get(n);
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request, baoService.GetCount(n), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			System.out.println(request.getQueryString());
			return "admin/bao";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	
	@RequestMapping("/admin_sum")
	public String admin_sum(Bao n) {
		String[] grade={"好","一般","差","不合格"};
		Admin a=(Admin)request.getSession().getAttribute("admin");
		n.setAdminId(a.getId());
		
		//List<Grade> gs=new ArrayList();
		String json="";
		for(int i=0;i<grade.length;i++)
		{
			n.setGrade(grade[i].toString());
			json+="{y:"+baoService.GetCount(n)+",color:colors["+i+"]},";
			//Grade g=new Grade();
			//g.setGrade(grade[i].toString());
			//g.setNum(baoService.GetCount(n));
			//gs.add(g);
		}
		json=json.length()>0?json.substring(0,json.length()-1):"";
		//json="["+json+"]";
		request.setAttribute("json", json);
		return "admin/sum";
		
	}

	

	
	
	@SuppressWarnings("all")
	@RequestMapping(value="/del", method = RequestMethod.POST)
	public void Del(@RequestParam(value = "id") int id) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			System.out.println("================================");
			System.out.println(id);
			//int id=Integer.parseInt(request.getParameter("id"));
			
			int r = baoService.Del(id);
			
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
	}
	
	
}