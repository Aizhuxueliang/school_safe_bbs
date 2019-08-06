<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
 <head>
<meta charset="utf-8">
<title></title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="js/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="js/layui/css/Global.css" media="all" />
<link rel="stylesheet" href="css/nav_item.css">
<script src="<%=basePath %>js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=basePath %>js/layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath %>js/layui/layui.js"  type="text/javascript"></script>
</head>
  
 <body>
    <div class="layui-fluid">
  	<div class="layui-row">
  		<div class="layui-col-md12 layui-col-xs12">
  	<%@ include file="top.jsp"%>
  	<div id="main">
  	<%-- <button class="layui-btn layui-btn-normal" onclick="location.href='<%=basePath%>room/add.do?hid=<%=request.getParameter("hid")%>'">添加</button> --%>
  		<table id="sqltable">
		                <tr class="title">
			               <td>帖子分类</td>
			                <td>操作</td>
		                </tr>
                		<c:forEach var="list"  items="${list}">
		                <tr class="rows">
			                <td>${list.type}</td>
			                <td>
				                <a href="<%=basePath %>newstype/add.do?id=${list.id}">更新</a>
				                <a href="javascript:;;" id="${list.id }" class="del">删除</a>
			                </td>
		                </tr>
		                </c:forEach>
	                </table>
  	</div>
  	</div>
  	</div>
  	</div>
      	 <script>
    $(function(){ 
    	$(".del").click(function(){
    		var id = $(this).attr("id");//以逗号作为分隔字符串
		    $.messager.confirm("系统提示", "您确认要删除这条数据吗？", function(r) {
				if (r) {
					$.post("${basePath}newstype/newstype_del.do", {
						id:id
					}, function(result) {
						if (result.success) {
								 $.messager.alert("系统提示", result.mgf, "info", function () {
									window.location.reload();
						        }); 
						} else {
							$.messager.alert("系统提示", result.mgf);
						}
					}, "json");
				}
			});
    	});
    })
    </script>
  </body>
</html>
