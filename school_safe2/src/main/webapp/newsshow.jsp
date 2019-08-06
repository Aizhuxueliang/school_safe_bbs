<%@page import="com.java.service.IntroduceService"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

.main-data img{
	width: 100%;
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
                <div class="map1"><b>事件详情</b></div>
                <div class="main-data">
	                <div style="width:100%; text-align:center; padding-bottom:20px; color:black">
	                	<font size="16px">${news.title}</font>
	                </div>
	                <div id="line">
	                	<span>点击率：${news.hot }</span>
	                	<span>事件日期：<fmt:formatDate value="${news.intime}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
	                </div>
                </div>
				
				
                <div class="main-data">
                	${news.content}
                </div>
                <blockquote class="layui-elem-quote">
                	<button class="layui-btn layui-btn-sm" id="zan">点击(${news.zan }下)</button>
					<button class="layui-btn layui-btn-sm" id="conn"><i class="layui-icon"></i></button>
				</blockquote>
                
                <div class="map1"><b>事件回复</b></div>
                <div class="main-data">
                <c:forEach var="list"  items="${pinglun_list}">
				 
				<blockquote class="layui-elem-quote layui-quote-nm">
				    ${list.title }>
				  ${list.content }
				</blockquote>
				</c:forEach>
				<form class="layui-form" id="sqlform" method="post">
				<div class="layui-form-item">
				    <label class="layui-form-label">主题</label>
				    <div class="layui-input-block">
				      <input name="title" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" type="text">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">内容</label>
				    <div class="layui-input-block">
				      <textarea id="content" name="content" lay-verify="content" style="width:98%; height:100px"></textarea>
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">&nbsp;</label>
				    <div class="layui-input-block">
				      <input class="layui-btn" lay-submit  lay-filter="demo1"  type="submit" value="回复"></input>
				    </div>
				  </div>
				  </form>
				</div>
            </div>
        </div>
    </div>
   	<div class="layui-row layui-hide-xs">
   		<div class="layui-col-md12 layui-col-xs12">
   		</div>
   	</div>
  </div>
    
<script type="text/javascript">
//Demo
layui.use(['form', 'layedit', 'laydate','layer'], function(){
 var form = layui.form
 ,layedit = layui.layedit
 ,laydate = layui.laydate
 ,layer=layui.layer;
//创建一个编辑器
 var editIndex = layedit.build('content',{
	  tool: ['left', 'center', 'right', 'strong', 'face']
 	  ,height: 180
 });
//同步编辑器，否则获取不到更新的内容
 form.verify({
	   content: function(value){
		      layedit.sync(editIndex);
		    }
	})
	
	$("#zan").click(function(){
		
		$.post("${basePath}news/zan.do", { id: "${news.id}" },
		   function(result){
				if (result.success) {
					$.messager.alert("系统提示", result.mgf, "info", function () {
						location.href='${basePath}news/show.do?id=${news.id}';
			        }); 
				} else {
					$.messager.alert("系统提示", result.mgf);
				}
		   }, "json");
	})
	
	$("#conn").click(function(){
		
		$.post("${basePath}connection/add.do", { id: "${news.id}" },
		   function(result){
				if (result.success) {
					$.messager.alert("系统提示", result.mgf, "info", function () {
						location.href='${basePath}news/show.do?id=${news.id}';
			        }); 
				} else {
					$.messager.alert("系统提示", result.mgf);
				}
		   }, "json");
	})

//监听提交
 form.on('submit(demo1)', function(data){
	       $("#sqlform").form("submit",{
				url : "${basePath}pinglun/pinglun_add.do?id=${news.id}",
				onSubmit : function() { },
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
							$.messager.alert("系统提示", result.mgf, "info", function () {
								location.href='${basePath}news/show.do?id=${news.id}';
					        }); 
						} else {
							$.messager.alert("系统提示", result.mgf);
						}
				}
			});  
		 return false;
	}) 
});
	
</script>
  </body>
</html>
