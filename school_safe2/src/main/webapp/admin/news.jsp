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
.table-style{
	border-collapse: collapse;
	font: 16px Tahoma,Helvetica,Arial,'宋体',sans-serif;
	width: 100%;
	line-height: 25px;
}

.table-style .td1 {
	width: 30%;
	border: solid 1px #CCCCCC;
	padding: 0px 10px;
	border-collapse: collapse;
}

.table-style td {
	border: solid 1px #CCCCCC;
	padding: 0px 20px;
	border-collapse: collapse;
}

td input{
	font-size: 14px;
}
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
  		<c:forEach var="list"  items="${list}">
  		<table class="table-style">
  			<tr>
  				<td class="td1">事件编号</td>
  				<td>${list.id}</td>
  			</tr><tr>
  				<td class="td1">事件标题</td>
  				<td>${list.title}</td>
  			</tr><tr>
  				<td class="td1">事件类别</td>
  				<td>${list.newstype.type}</td>
  			</tr><tr>
  				<td class="td1">发布日期</td>
  				<td><fmt:formatDate value="${list.intime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
  			</tr><tr>
  				<td class="td1">点击率</td>
  				<td>${list.hot}次</td>
  			</tr><tr>
  				<td class="td1">处理状态</td>
  				<td>
  					<form id="statusform" class="layui-form" method="post">
					    <div class="layui-input-inline">
					    	  <input type="hidden" id="numbers" name="numbers" value="${list.id}">
						      <input type="text" id="stat" name="stat" value="${list.src}"/>
						      <input type="submit" lay-filter="demo2"  lay-submit value="更新状态" class="layui-btn layui-btn-xs" />
						 </div>
			    	</form>
  				</td>
  			</tr><tr>
  				<td class="td1">其他操作</td>
  				<td>
                	<a href="<%=basePath %>pinglun/admin_list.do?newsId=${list.id}">评论</a>
	                <a href="javascript:;;" id="${list.id }" class="del">删除</a>
                </td>
  			</tr>
  		</table>
  		<br>
  		</c:forEach>
  		
  		
        <div style="width:100%; margin-left:24px; background:white; text-align:center" id="pagediv">
	  			${pages }
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
					$.post("${basePath}news/del.do", {
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
    });
    
    
    
   // Demo
layui.use(['form','layer'], function(){
     var form = layui.form
     ,layer=layui.layer;
   
   //监听提交
     form.on('submit(demo2)', function(data){
	       $("#statusform").form("submit",{
				url : "${basePath}news/edit_status.do",
				onSubmit : function() { },
				success : function(result) {
					var result = eval('(' + result + ')');
				    if (result.success) {
				    	$.messager.alert("系统提示", result.mgf, "info", function () {
				    		location.href='${basePath}news/admin_list.do';
				        }); 
						
					} else {
						$.messager.alert("系统提示", result.mgf);
						return;
					}  
				}
			});  
    		 return false;
    	}) 
});

 
  
</script>
  </body>
</html>
