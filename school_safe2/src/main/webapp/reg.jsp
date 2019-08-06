<%@page import="com.java.service.IntroduceService"%>
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
					<div class="map1">
						<b>用户注册</b>
					</div>
				<div class="main-data">

					<form id="reg" class="layui-form" method="post">

						<div class="layui-form-item">
							<label class="layui-form-label">用户名</label>
							<div class="layui-input-block">
								<input name="login" lay-verify="required" placeholder="请输入"
									autocomplete="off" class="layui-input" type="text">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">密码</label>
							<div class="layui-input-block">
								<input name="pwd" id="pwd" lay-verify="pwd" placeholder="请输入"
									autocomplete="off" class="layui-input" type="password">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">确认密码</label>
							<div class="layui-input-block">
								<input name="twopwd" id="twopwd" lay-verify="twopwd"
									placeholder="请输入" autocomplete="off" class="layui-input"
									type="password">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">性别</label>
							<div class="layui-input-block">
								<input name="sex" value="男" title="男" checked="" type="radio">
								<input name="sex" value="女" title="女" type="radio">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">电话</label>
							<div class="layui-input-block">
								<input name="tel" lay-verify="required|phone" placeholder="请输入"
									autocomplete="off" class="layui-input" type="text">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">地址</label>
							<div class="layui-input-block">
								<input name="address" lay-verify="required" placeholder="请输入"
									autocomplete="off" class="layui-input" type="text">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">邮箱</label>
							<div class="layui-input-block">
								<input name="mail" lay-verify="email" placeholder="请输入"
									autocomplete="off" class="layui-input" type="text">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">&nbsp;</label>
							<div class="layui-input-block">
								<input class="layui-btn layui-btn-primary" id="sub" type="submit"
									lay-filter="demo1" lay-submit value="注册"></input>
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
     
   //自定义验证规则
     form.verify({
       pwd: [/(.+){6,12}$/, '密码必须6到12位']
       ,twopwd: function(value){
         if($("#pwd").val()!=value)
           return "两次输入的密码不一至";
       }
     });
   
   //监听提交
     form.on('submit(demo1)', function(data){
	       $("#reg").form("submit",{
				url : "${basePath}client/client_add.do",
				onSubmit : function() { },
				success : function(result) {
					var result = eval('(' + result + ')');
				    if (result.success) {
				    	$.messager.alert("系统提示", result.mgf, "info", function () {
				    		location.href='${basePath}index.do';
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
