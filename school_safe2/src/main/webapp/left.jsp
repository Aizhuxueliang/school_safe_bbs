<%@ page language="java" import="java.util.*,com.java.model.*" pageEncoding="utf-8"%>
<%
	String path_left = request.getContextPath();
	String basePath_left = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path_left + "/";
	pageContext.setAttribute("basePath_left", basePath_left);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#bord_style{
	height: 80px;
	width: 80px;
	padding: 10px;
	border: 1px solid #393D49;
	background-color: #2F4056;
	border-radius: 50%;
	color: #ffffff;
}

#bord_style font a{
	color: #ffffff;
}

.lefttop {
	font-size: 16px;
	background: #2F4056;
	height: 30px;
	width: 100%;
	text-align: left
}

/* .lefttop {
	height: 30px;
	background: ##2F4056;
	background-repeat: no-repeat;
	background-position: left;
	border: solid 1px #DCDCDC
} */

.lefttop b {
	color: White;
	display: block;
	width: 100%;
	height: 30px;
	text-align: left;
	padding: 3px;
	font-size: 16px;
}

.leftfont{
	font: 16px/1.5 Tahoma,Helvetica,Arial,'宋体',sans-serif;
}

.leftform{
	border: 1px solid #393D49;
	font-size: 14px;
}

.nav-style{
	width: 100%;
	background: #2F4056;
}

.layui-nav-item a{
	font: 16px/1.5 Tahoma,Helvetica,Arial,'宋体',sans-serif;
	color: #000;
}
</style>
<div class="leftborder">
     <div class="lefttop">
     	<b>个人信息</b>
     </div>
     <span>
     	<%if(session.getAttribute("client")==null){ %>
     	<form class="layui-form" id="sqlform" method="post">
         <div><font class="leftfont">用户:</font><input id="Text1" name="login" lay-verify="required" type="text" class="leftform"/></div>
         <div><font class="leftfont">密码:</font><input id="Text2" name="pwd" lay-verify="required" type="password" class="leftform"/></div>
         <div class="layui-input-block">
	         <input id="Button1" type="submit" value="登录" lay-submit  lay-filter="loginbtn" class="layui-btn layui-btn-primary"/>
	         <input id="Button2" type="button" value="注册" onclick="location.href='<%=basePath_left%>client/reg.do'" class="layui-btn layui-btn-primary"/>
         </div>
         </form>
         <%}else{
	   		Client c=(Client)session.getAttribute("client");
		 %>
		  
		<ul class="layui-nav layui-nav-tree nav-style" lay-filter="test">
			<li class="layui-nav-item">
		  		<a href="<%=basePath_left %>news/addpage.do"  style="color: #FF5722;"><i class="layui-icon">&#xe609;</i>&nbsp;发布事件</a>
		  	</li><li class="layui-nav-item">
		  		<a href="<%=basePath_left %>client/editform.do"><i class="layui-icon">&#xe716;</i>&nbsp;修改资料</a>
		  	</li><li class="layui-nav-item">
		  		<a href="<%=basePath_left %>client/pwd.do"><i class="layui-icon">&#xe642;</i>&nbsp;修改密码</a>
		  	</li><li class="layui-nav-item">
		  		<a href="<%=basePath_left %>news/my_list.do"><i class="layui-icon">&#xe6b2;</i>&nbsp;事件记录</a>
		  	</li><li class="layui-nav-item">
		  		<a href="<%=basePath_left %>typeconnection/mylist.do"><i class="layui-icon">&#xe600;</i>&nbsp;分类收藏</a>
		  	</li><li class="layui-nav-item">
		  		<a href="<%=basePath_left %>pinglun/my_list.do"><i class="layui-icon">&#xe62f;</i>&nbsp;回复记录</a>
		  	</li><li class="layui-nav-item">
		  		<a href="<%=basePath_left %>connection/mylist.do"><i class="layui-icon">&#xe60e;</i>&nbsp;事件收藏</a>
		  	</li><li class="layui-nav-item">
		  		<a id="exit" href="<%=basePath_left %>client/exit.do"><i class="layui-icon">&#x1007;</i>&nbsp;安全退出</a>
		  	</li>
		</ul>
		 
		 
		 <%} %>
     </span>
 </div>
  <div class="leftborder layui-hide-xs">
                    <div class="lefttop"><b>版块分类</b></div>
                    <ul class="typeul">
                    	<c:forEach var="list"  items="${menu}">
                        <li><a href="javascript:;;">${list.type }</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <script type="text/javascript">
//Demo
layui.use(['form', 'layedit', 'laydate','layer'], function(){
     var form = layui.form
     ,layedit = layui.layedit
     ,laydate = layui.laydate
     ,layer=layui.layer;
   
   //监听提交
     form.on('submit(loginbtn)', function(data){
	       $("#sqlform").form("submit",{
				url : "${basePath_left}client/login.do",
				onSubmit : function() { },
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
							$.messager.alert("系统提示", result.mgf, "info", function () {
								location.href='${basePath}index.do';
					        }); 
						} else {
							$.messager.alert("系统提示", result.mgf);
						}
				}
			});  
    		 return false;
    	}) 
});

$("#exit").click(function(){
    $.messager.confirm("系统提示", "确认要退出吗？", function(r) {
		if (r) {
			 $.post("${basePath}client/exit.do", function(result) {
				if (result.success) {
						 $.messager.alert("系统提示", result.mgf, "info", function () {
							location.href='${basePath}index.do';
				        }); 
				} else {
					$.messager.alert("系统提示", result.mgf);
				}
			}, "json"); 
		}
	});
    return false; // 阻止表单自动提交事件
});
 
</script>
  