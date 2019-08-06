<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

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
</head>
  
 <body>
    <div class="layui-fluid">
  	<div class="layui-row">
  		<div class="layui-col-md12 layui-col-xs12">
  	<%@ include file="top.jsp"%>
  	<div id="main">
  		<table id="sqltable">
		                <tr class="title">
			               <td>名称</td>
			                <td>操作</td>
		                </tr>
                		<c:forEach var="list"  items="${list}">
		                <tr class="rows">
			                <td>${list.type}</td>
			                <td>
				                <a href="introduce_messhow.do?id=${list.id}">更新</a>
			                </td>
		                </tr>
		                </c:forEach>
	                </table>
  	</div>
  	
    </div>
    </div>
    </div>
  </body>
</html>
