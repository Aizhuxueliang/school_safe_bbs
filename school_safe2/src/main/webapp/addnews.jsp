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
<script src="<%=basePath %>js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=basePath %>js/layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath %>js/layui/layui.js"  type="text/javascript"></script>
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
						<b>发布安全事件</b>
					</div>
					<div class="main-data">

						<form class="layui-form" id="sqlform" method="post">
							<div class="layui-form-item">
								<label class="layui-form-label">标题：</label>
								<div class="layui-input-block">
									<input type="text" lay-verify="required" name="title"
										class="layui-input" value="${news.title}" />
								</div>
							</div>
							
							<div class="layui-form-item"></div>
							<div class="layui-form-item">
								<label class="layui-form-label">版块：</label>
								<div class="layui-input-block">
									<select name="newstypeId" lay-filter="aihao">
										<c:forEach var="list" items="${newstype}">
											<option value="${list.id }">${list.type }</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="layui-form-item">
								<label class="layui-form-label">内容：</label>
								<div class="layui-input-block">
									<textarea id="content" name="content" lay-verify="content"
										style="width: 98%; height: 100px">${news.content}</textarea>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">&nbsp;</label>
								<div class="layui-input-block">
									<input class="layui-btn" lay-submit
										lay-filter="demo1" type="submit" value="提交"></input>
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
layui.use(['form', 'layedit', 'laydate','layer','upload'], function(){
   var form = layui.form
   ,layedit = layui.layedit
   ,laydate = layui.laydate
   ,layer=layui.layer
   ,upload = layui.upload;;
   
   
   layedit.set({
	   uploadImage: {
	   url: '${basePath}upload.do' //接口url
	   ,type: 'post' //默认post
	   }
	   });
   var editIndex = layedit.build('content',{
	   height: 500
   }); 
   //同步编辑器，否则获取不到更新的内容
   form.verify({
	   content: function(value){
		      layedit.sync(editIndex);
		    }
	})
	
 //监听提交
   form.on('submit(demo1)', function(data){
	       $("#sqlform").form("submit",{
				url : "${basePath}news/add.do?id=${news.id}",
				onSubmit : function() { },
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
							$.messager.alert("系统提示", result.mgf, "info", function () {
								location.href='${basePath}news/my_list.do';
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
<script>
layui.use('upload', function(){
  var $ = layui.jquery
  , upload = layui.upload;

   
  
   
//普通图片上传
  var uploadInst = upload.render({
    elem: '#test1'
    ,accept:'images'
    ,auto:true
    ,size:102400//上传附件大小
    ,url: '../upload.do'
    ,done: function(res){
      //如果上传失败
      if(res.code > 0){
        return layer.msg('上传失败');
      }
      $("#src").val(res.data.src);
      return layer.msg('上传成功');
    }
  });
  
});
    </script>
  </body>
</html>
