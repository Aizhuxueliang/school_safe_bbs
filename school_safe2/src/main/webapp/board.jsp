<%@page import="com.java.service.IntroduceService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                <div class="map1"><b>在线反馈</b></div>
                <div class="main-data">
                
              <form  method='post' id="sub"  class="layui-form layui-form-pane">
                	 <div class="layui-form-item">
					    <label class="layui-form-label">主题</label>
					    <div class="layui-input-block">
					      <input name="title" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input" type="text">
					    </div>
					  </div>
					   <div class="layui-form-item layui-form-text">
						    <label class="layui-form-label">反馈内容</label>
						    <div class="layui-input-block">
						      <textarea placeholder="请输入内容" name="content" class="layui-textarea"></textarea>
						    </div>
						  </div>
                    	<div class="layui-form-item">
						    <input type="submit" class="layui-btn" lay-submit="" lay-filter="demo2" value="反馈"></button>
						  </div>
                    </form>
                    
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
					  <legend>反馈区域</legend>
					</fieldset>
                	<div class="layui-collapse" lay-filter="test">
                	
                	<c:forEach items="${ list }" var="b">
                	<div class="layui-colla-item">
				    <h2 class="layui-colla-title">${b.title }${b.client.name }反馈于<fmt:formatDate value="${b.intime }" pattern="MM-dd"/></h2>
				    <div class="layui-colla-content  layui-show" style="text-align:left">
				      <p>${b.content }</p>
				    </div>
				  </div>
                    
                    </c:forEach>
                    </div>
                    <script>
					//layui.use('element', function(){
					  //var element = layui.element();
					//});
					
					$(function(){
						$("form").submit(function(){
						    $.post("${basePath}board/add.do",$("#sub").serialize(),function(data){
					    		if(data.success)
		 						  {
		 							  layer.alert(data.mgf,function(){
		 								  window.location.reload();
		 							  })
		 						  }
		 						  else
		 							  layer.alert(data.mgf);
					    	},"json");
							return false;
						})
					})
					</script>
                
            </div>
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
