<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  		<form class="layui-form" id="sqlform" method="post">
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
	  	            <tr>
	  		            <td class="left">检查区域：</td>
	  		            <td class="right"><input type="text" lay-verify="required" name="title" class="layui-input" value="${bao.title}" /></td>
	  	            </tr>
	  	             <tr>
	  		            <td class="left">安全类别：</td>
	  		            <td class="right">
							<select name="grade" lay-filter="aihao">
						        <option value="好" checked="true">好</option>
						        <option value="一般">一般</option>
						        <option value="差">差</option>
						        <option value="不合格">不合格</option>
						      </select>
						</td>
	  	            </tr>
	  	            <tr>
	  		            <td class="left">应用措施：</td>
	  		            <td class="right">
							<textarea id="content" name="content" lay-verify="content" style="width:98%; height:50px">${bao.content}</textarea>
						</td>
	  	            </tr>
	  	            <tr>
	  		            <td class="left">检查日期：</td>
	  		            <td class="right"><input type="text" lay-verify="required" id="intime" name="intime" class="layui-input" value="<fmt:formatDate value="${bao.intime }" pattern="yyyy-MM-dd"/>" /></td>
	  	            </tr>
	  	            <tr>
	  		            <td class="left">&nbsp;</td>
	  		            <td class="right"><input class="layui-btn layui-btn-normal" lay-submit  lay-filter="demo1"  type="submit" value="提交"></input></td>
	  	            </tr>
	  	        </table>
	  	  </form>
  	</div>
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
   
   //常规用法
     laydate.render({
       elem: '#intime',
       max:0
     });
   //监听提交
     form.on('submit(demo1)', function(data){
	       $("#sqlform").form("submit",{
				url : "${basePath}bao/add.do?id=${bao.id}",
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
