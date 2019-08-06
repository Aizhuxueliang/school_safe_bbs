<%@ page language="java" import="java.util.*,com.java.model.*" pageEncoding="utf-8"%>
<%
String path_top = request.getContextPath();
String basePath_top = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path_top+"/";
%>
<link href="<%=basePath_top %>admin/css/css.css" rel="stylesheet" type="text/css" />

<script src="<%=basePath_top %>js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=basePath_top %>js/layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath_top %>js/layui/layui.js"  type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath_top %>js/layui/css/layui.css" />

<link rel="stylesheet" href="<%=basePath_top %>css/nav_item.css" media="all">

<link class="uiTheme" rel="stylesheet" type="text/css" href="<%=basePath_top %>js/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath_top %>js/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/jquery.cookie.js"></script>
<%
	Admin a=(Admin)session.getAttribute("admin");
%>
<style>
.nav_item>a {
    display: block;
    padding: 0 15px;
    line-height: 50px;
    font-size: 18px;
    color: #fff;
    -webkit-transition: all .4s;
    transition: all .4s;
}
.top_name{
	font: 40px/2 Tahoma,Helvetica,Arial,'宋体',sans-serif;
	height: 80px;
	width: 100%;
	color: #fff;
	line-height: 70px;
	padding: 5px;
	background-color: #2F4056;
}
</style>
<div class="top_name">校园安全防范</div>	
<div class="menu_open">
	    <i></i>
	    <i></i>
	    <i></i>
	</div>
	<div class="nav">
	    <ul class="nav_ul clearfix layui-bg-cyan">
	        <%if(a.getAuthor()==1){ %>
            <li class="nav_item"><a href="<%=basePath_top %>news/admin_list.do">事件管理</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>client/client_list.do">用户管理</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>newstype/add.do">添加版块</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>newstype/newstype_list.do">版块管理</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>introduce/introduce_list.do">系统信息</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>pinglun/admin_list.do">评论管理</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>admin/addpage.do">添加角色</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>admin/admin_list.do">角色管理</a></li>
            <%}else{ %>
            <li class="nav_item"><a href="<%=basePath_top %>bao/addpage.do">添加安检</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>bao/admin_list.do">安检管理</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>bao/admin_sum.do">安检汇总</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>news/admin_list.do">事件管理</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>board/admin_list.do">安全反馈</a></li>
            <%} %>
            <li class="nav_item"><a href="<%=basePath_top %>index.do">返回首页</a></li>
            <li class="nav_item"><a href="<%=basePath_top %>admin/exit.do">安全退出</a></li>
	    </ul>
	</div>
	<div class="hcover"></div>

	<script>
		$(function () {
		    $(".menu_open").click(function () {
		        $(".nav").animate({ 'left': '0' }, 400);
		        $(".hcover").animate({ 'right': '0' }, 400);
		    });
		    $(".hcover").click(function () {
		        $(this).animate({ 'right': '-50%' }, 400);
		        $(".nav").animate({ 'left': '-50%' }, 400);
		        $(".nav_ul").animate({ 'left': '0' }, 400);
		        $('.nav_item_open').css('left', '-50%');
		    });
		    $(".nav_item i").click(function () {
		        $(".nav_ul").animate({ 'left': '-100%' }, 400);
		        $(this).next('.nav_item_open').css('left', '0');
		    });
		    $(".subopen").click(function () {
		        $(this).parent('.nav_item_open').css('left', '-50%');
		        $(".nav_ul").animate({ 'left': '0' }, 400);
		    });
		});
	</script>

