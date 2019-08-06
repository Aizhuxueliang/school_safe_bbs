<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
#pagediv a,#pagediv a:visited{
   color: #393D49;
   margin:5px; 
   font: 16px/1.5 Tahoma,Helvetica,Arial,'宋体',sans-serif;
}
</style>
</head>
  
 <body>
    <div class="layui-fluid">
  	<div class="layui-row">
  		<div class="layui-col-md12 layui-col-xs12">
  	<%@ include file="top.jsp"%>
  	<div id="main">

<div id="main">
<blockquote class="layui-elem-quote layui-quote-nm">
  	<form method="post" action="<%=basePath %>bao/admin_list.do" class="layui-form">
		<script>
		layui.use(['form', 'layedit', 'laydate','layer'], function(){
		     var form = layui.form
		     ,layedit = layui.layedit
		     ,laydate = layui.laydate
		     ,layer=layui.layer;
		  
		//年月选择器
		     laydate.render({
		       elem: '#starttime'
		     });
		   //年月选择器
		     laydate.render({
		       elem: '#endtime'
		     });
		});
		</script>
  		<div class="layui-form-item">
  		<div class="layui-inline">
	      <label class="layui-form-label">安全级别</label>
	      <div class="layui-input-inline">
	      <select name="grade">
	      	<option value="好" checked="true">好</option>
						        <option value="一般">一般</option>
						        <option value="差">差</option>
						        <option value="不合格">不合格</option>
		      </select>
		      </div>
	    </div>
	    <div class="layui-inline">
	      <label class="layui-form-label">起始日期</label>
	      <div class="layui-input-inline">
	        <input type="text" id="starttime" placeholder="yyyy-MM-dd" lay-verify="required" class="layui-input" name="starttime"  />
	      </div>
	    </div>
	    <div class="layui-inline">
	      <label class="layui-form-label">结束日期</label>
	      <div class="layui-input-inline">
	        <input type="text" id="endtime" placeholder="yyyy-MM-dd" lay-verify="required" class="layui-input" name="endtime"  />
	      </div>
	    </div>
	    <div class="layui-inline">
	      <div class="layui-input-inline">
	        <button class="layui-btn layui-btn-primary" type="submit">查询</button>
	      </div>
	    </div>
	  </div>

		</form>
		</blockquote>
		</div>
		
		<div id="main">
  		<table id="sqltable" >
  		
		               <tr class="title">
				    		<td>检查区域</td>
				    		<td>检查日期</td>
				    		<td>安全级别</td>
				    		<td>操作</td>
		                </tr>
                		<c:forEach var="list"  items="${list}">
		                <tr class="rows">
				    		<td>${list.title}</td>
				    		<td><fmt:formatDate value="${list.intime }" pattern="MM-dd"/></td>
				    		<td>${list.grade}</td>
				    		<td>
				    			<a href="<%=basePath %>bao/addpage.do?id=${list.id}">更新</a>
				    			<a href="javascript:;;" id="${list.id }" class="del">删除</a>
				    		</td>
		                </tr>
		                </c:forEach>
	                </table>
	                <div style="width:100%; margin-left:24px; background:white; text-align:center" id="pagediv">
				  		${pages }
				  		</div>
				  		</div>
  	</div>
    </div>
    </div>
    </div>
    <script>
    $(function(){ 
    	$(".del").click(function(){
    		var id = $(this).attr("id");
		    $.messager.confirm("系统提示", "您确认要删除这条数据吗？", function(r) {
				if (r) {
					$.post("${basePath}bao/del.do", {
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
