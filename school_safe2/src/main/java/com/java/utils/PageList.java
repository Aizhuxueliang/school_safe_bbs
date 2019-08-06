package com.java.utils;

import javax.servlet.http.HttpServletRequest;

public class PageList {
	public static String Page(HttpServletRequest request,int rcount,int pagesize,int startindex,String urlstring)
	{
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
		String html="";
		int sumcount=0;
		
		String pageurl=getBase(request);
		String pagename="";
		if(urlstring==null)
			pagename=basePath+pageurl+"?1=1&&";
		else
		{
			//处理重复的参数
			if(urlstring.indexOf("startindex")>0)
				urlstring=urlstring.substring(0,urlstring.indexOf("startindex")-2);
			
			pagename = basePath+pageurl+"?"+urlstring+"&&";
		}
		if(rcount%pagesize==0)
			sumcount=rcount/pagesize;
		else
			sumcount=rcount/pagesize+1;
		if(startindex==0)//判断是否是第一页
			html="<a style=''>首页</a><a style=''>上一页</a>";
		else
			html="<a style='' href='"+pagename+"startindex=0'>首页</a><a style='' href='"+pagename+"startindex="+Integer.toString(startindex-1)+"'>上一页</a>";
		if(sumcount-1==startindex)//判断是否是最后一页
			html+="<a style=''>下一页</a><a style=''>尾页</a>";
		else
			html+="<a style='' href='"+pagename+"startindex="+Integer.toString(startindex+1)+"'>下一页</a><a style='' href='"+pagename+"startindex="+Integer.toString(sumcount-1)+"'>尾页</a>";
		return html;
	}
	
	public static String getBase(HttpServletRequest request) {
		String url=request.getRequestURI();//    /ssh/admin/News_Get.action
		url=url.substring(1,url.length());
		url=url.substring(url.indexOf("/")+1);
		return url;
	}
}
