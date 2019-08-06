<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
 <head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script src="<%=basePath %>js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=basePath %>js/layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath %>js/layui/layui.js"  type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath %>js/layui/css/layui.css" />
<link class="uiTheme" rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-1.3.3/jquery.cookie.js"></script>
<style type="text/css">
html,body{height: 100%;width: 100%;margin:0;padding:0;}
body{
  background:url(images/bg.jpg) no-repeat;
  width:100%;
  height:100%;
  background-size:100% 100%;
  position:absolute;
  filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/bg.jpg',sizingMethod='scale');
}
</style>
<title>登录页面</title>

</head>
<body>
<div class="layui-fluid">
	<div style="padding-top: 15%;"></div>
	<div class="layui-row">
	<div class="layui-col-md5 layui-col-md-offset3 layui-col-xs12" align="center">
		
	<form class="layui-form" id="sqlform" method="post">
		<div class="layui-form-item">
			<h1>欢迎登录</h1>
		</div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">用户：</label>
		    <div class="layui-input-block">
		      <input type="text" name="login" lay-verify="required" placeholder="请输入用户名" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">密码：</label>
		    <div class="layui-input-block">
		      <input type="password" name="pwd" lay-verify="required" placeholder="请输入密码" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
			    <input name="author" value="1" title="管理" checked="" type="radio">
				<input name="author" value="3" title="教师" type="radio">
				<input name="author" value="4" title="校长" type="radio">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <input lay-submit  lay-filter="demo1"  type="submit" value="登录" class="layui-btn layui-btn-primary" />
		      <input type="button" value="返回主页" class="layui-btn layui-btn-primary" onclick="goRegister()"/>
		    </div>
		  </div>
		  
	</form>
	</div>
	</div>
</div>
	<!-- js -->
	<script type="text/javascript">
		function goRegister(){
			window.location.href="../index.jsp";
		}
	</script>
	<script type="text/javascript">
//Demo
layui.use(['form', 'layedit', 'laydate','layer'], function(){
     var form = layui.form
     ,layedit = layui.layedit
     ,laydate = layui.laydate
     ,layer=layui.layer;
   
   //监听提交
     form.on('submit(demo1)', function(data){
	       $("#sqlform").form("submit",{
				url : "${basePath}admin/login.do",
				onSubmit : function() { },
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
							$.messager.alert("系统提示", result.mgf, "info", function () {
								location.href='${basePath}bao/admin_list.do';
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