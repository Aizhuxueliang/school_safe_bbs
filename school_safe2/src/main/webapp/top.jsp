<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path_top = request.getContextPath();
	String basePath_top = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path_top + "/";
	//List<NewsType> ls=
	request.setAttribute("menu", request.getSession().getAttribute("menu"));
	request.setAttribute("path_top", basePath_top);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=basePath_top %>js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=basePath_top %>js/layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath_top %>js/layui/layui.js"  type="text/javascript"></script>
<link rel="stylesheet" href="<%=basePath_top %>js/layui/css/layui.css" media="all" />

<link rel="stylesheet" href="<%=basePath_top %>css/nav_item.css" media="all">

<link rel="stylesheet" type="text/css" href="<%=basePath_top %>js/jquery-easyui-1.3.3/themes/default/easyui.css" class="uiTheme">
<link rel="stylesheet" type="text/css" href="<%=basePath_top %>js/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath_top %>js/jquery-easyui-1.3.3/jquery.cookie.js"></script>

<link href="<%=basePath_top %>css/StyleSheet.css" rel="stylesheet" type="text/css" />
<style>
.nav_item>a {
    display: block;
    padding: 0 15px;
    line-height: 50px;
    font-size: 18px;
    color: #fff;
    -webkit-transition: all .4s;
    transition: all .4s;
}

@media screen and (min-width:1001px) {
    .nav_item.active>a {
        color: #009688;
    }
    .nav_item:hover>a {
        color: #009688;
    }
}

.top_name{
	font: 40px/1.5 Tahoma,Helvetica,Arial,'宋体',sans-serif;
	height: 80px;
	width: 100%;
	color: #2F4056;
	line-height: 70px;
	padding: 5px;
}

#test1{
    position:relative;
    overflow:hidden;
}
#test1 img{
    position: absolute;
    top: 50%;
    left: 50%;
    display: block;
    min-width: 100%;
    min-height: 100%;
    transform:translate(-50%,-50%);
}
</style>
<div class="top_name">校园安全防范</div>

<div class="menu_open">
	    <i></i>
	    <i></i>
	    <i></i>
	</div>
	<div class="nav">
	    <ul class="nav_ul clearfix layui-bg-cyan">
	        <li class="nav_item"><a href="<%=basePath_top %>index.do">首页</a></li>
		    <!-- <li class="nav_item">
	        	<span id="msgNum" class="layui-badge">0</span>
	        </li> -->
	        <c:forEach var="list"  items="${menu}">
	        <li class="nav_item">
	        	<a href="<%=basePath_top %>news/web_list.do?newstypeId=${list.id}">${list.type }</a>
	        </li>
		    </c:forEach>
	        <li class="nav_item "><a href="<%=basePath_top %>newstype.jsp">版块收藏</a></li>
	        <li class="nav_item"><a href="<%=basePath_top %>board/web_list.do">在线反馈</a></li>
	        <li class="nav_item"><a href="<%=basePath_top%>admin/login.jsp">安全管理</a></li>
	        <li class="nav_item"><a href="<%=basePath_top %>introduce/call.do?id=2">联系我们</a></li>
	    </ul>
	</div>
	<div class="hcover"></div>

	<script>
		$(function () {
		    $(".menu_open").click(function () {
		        $(".nav").animate({ 'left': '0' }, 400);
		        $(".hcover").animate({ 'right': '0' }, 400);
		    });
		    $(".hcover").click(function () {
		        $(this).animate({ 'right': '-50%' }, 400);
		        $(".nav").animate({ 'left': '-50%' }, 400);
		        $(".nav_ul").animate({ 'left': '0' }, 400);
		        $('.nav_item_open').css('left', '-50%');
		    });
		    $(".nav_item i").click(function () {
		        $(".nav_ul").animate({ 'left': '-100%' }, 400);
		        $(this).next('.nav_item_open').css('left', '0');
		    });
		    $(".subopen").click(function () {
		        $(this).parent('.nav_item_open').css('left', '-50%');
		        $(".nav_ul").animate({ 'left': '0' }, 400);
		    });
		});
		
</script>
<div class="layui-row">
<div class="layui-col-md12 layui-col-xs12">
	<div class="layui-carousel" id="test1">
	  <div carousel-item>
	  	<div><img src="<%=basePath_top %>images/jump/2.jpg"></div>
	    <div><img src="<%=basePath_top %>images/jump/4.gif"></div>
	    <div><img src="<%=basePath_top %>images/jump/7.jpg"></div>
	  </div>
	</div>
</div>
</div>
<!-- 条目中可以是任意内容，如：<img src=""> -->
 
<script src="js/layui/layui.js"></script>
<script>
layui.use('carousel', function(){
  var carousel = layui.carousel;
  //建造实例
  carousel.render({
    elem: '#test1'
    ,width: '100%' //设置容器宽度
    ,height: '265px'
    ,arrow: 'hover' //始终显示箭头
    //,anim: 'updown' //切换动画方式
    ,interval: '1500'
  });
});
</script>




