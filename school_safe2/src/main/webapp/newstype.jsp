<%@page import="com.java.service.IntroduceService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<style type="text/css">
.map1 {
	height: 30px;
	background: #2F4056;
	background-repeat: no-repeat;
	background-position: left;
	border: solid 1px #2F4056;
}

.map1 b {
	color: White;
	display: block;
	width: 100%;
	height: 30px;
	text-align: left;
	padding: 3px;
	font-size: 16px;
}
</style>
</head>
  
 <body>
  
  <div class="layui-fluid">
  	<div class="layui-row">
  		<div class="layui-col-md12 layui-col-xs12">
    		<%@ include file="top.jsp" %>
    	</div>
	</div>
    <div class="layui-row layui-col-space10">
		<div class="layui-col-md2 layui-col-sm3 layui-col-xs12">
             <%@ include file="left.jsp" %> 
        </div>
        <div class="layui-col-md10 layui-col-sm9 layui-col-xs12">

            <div class="mainborder">
                <div class="map1"><b>事件分类</b></div>
                
					
			  <table class="layui-table">
			
			    <tbody>
			    <c:forEach var="list"  items="${menu}">
			      <tr>
			        <td><a href="<%=basePath_top %>news/web_list.do?newstypeId=${list.id}">${list.type }</a></td>
			        <td><button class="layui-btn layui-btn-sm typeconn"  id="${list.id }"><i class="layui-icon"></i></button></td>
			        
			      </tr>
			      </c:forEach>
			    </tbody>
			  </table>

<script>
	$(function(){
		
		$(".typeconn").click(function(){
			var id=$(this).attr("id");
			$.post("${basePath}typeconnection/add.do", { id: id },
			   function(result){
					$.messager.alert("系统提示", result.mgf);
			   }, "json");
		})
	})
</script>
		
            </div>
         </div>
    </div>
   	<div class="layui-row layui-hide-xs">
   		<div class="layui-col-md12 layui-col-xs12">
   		</div>
   	</div>
  </div> 
  </body>
</html>
