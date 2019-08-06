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
</head>
  
 <body>
    <div class="layui-fluid">
  	<div class="layui-row">
  		<div class="layui-col-md12 layui-col-xs12">
  	<%@ include file="top.jsp"%>
  	<div id="main">
  	
  	<blockquote class="layui-elem-quote layui-quote-nm">
  	<form method="post" action="<%=basePath %>bao/admin_sum.do" class="layui-form">
		<script>
		layui.use(['form', 'layedit', 'laydate','layer'], function(){
		     var form = layui.form
		     ,layedit = layui.layedit
		     ,laydate = layui.laydate
		     ,layer=layui.layer;
		  
		//年月选择器
		     laydate.render({
		       elem: '#starttime'
		     });
		   //年月选择器
		     laydate.render({
		       elem: '#endtime'
		     });
		});
		</script>
  		<div class="layui-form-item">
	    <div class="layui-inline">
	      <label class="layui-form-label">起始日期</label>
	      <div class="layui-input-inline">
	        <input type="text" id="starttime" placeholder="yyyy-MM-dd" lay-verify="required" class="layui-input" name="starttime"  />
	      </div>
	    </div>
	    <div class="layui-inline">
	      <label class="layui-form-label">结束日期</label>
	      <div class="layui-input-inline">
	        <input type="text" id="endtime" placeholder="yyyy-MM-dd" lay-verify="required" class="layui-input" name="endtime"  />
	      </div>
	    </div>
	    <div class="layui-inline">
	      <div class="layui-input-inline">
	        <button class="layui-btn layui-btn-primary" type="submit">查询</button>
	      </div>
	    </div>
	  </div>

		</form>
		</blockquote>
  		

		<script type="text/javascript">
$(function () {
    var chart;
    $(document).ready(function() {
    
        var colors = Highcharts.getOptions().colors,
            categories = ["好","一般","差","不合格"],
            name = '汇总',
            data = eval("([${json}])");
    
        function setChart(name, categories, data, color) {
			chart.xAxis[0].setCategories(categories, false);
			chart.series[0].remove(false);
			chart.addSeries({
				name: name,
				data: data,
				color: color || 'white'
			}, false);
			chart.redraw();
        }
    
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'column'
            },
            title: {
                text: '安检汇总图'
            },
            subtitle: {
                text: '安全检查统计图'
            },
            xAxis: {
                categories: categories
            },
            yAxis: {
                title: {
                    text: 'Total percent market share'
                }
            },
            plotOptions: {
                column: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function() {
                                var drilldown = this.drilldown;
                                if (drilldown) { // drill down
                                    setChart(drilldown.name, drilldown.categories, drilldown.data, drilldown.color);
                                } else { // restore
                                    setChart(name, categories, data);
                                }
                            }
                        }
                    },
                    dataLabels: {
                        enabled: true,
                        color: colors[0],
                        style: {
                            fontWeight: 'bold'
                        },
                        formatter: function() {
                            return this.y +'个';
                        }
                    }
                }
            },
            tooltip: {
                formatter: function() {
                    var point = this.point,
                        s = this.x +':<b>'+ this.y +'% market share</b><br/>';
                    if (point.drilldown) {
                        s += 'Click to view '+ point.category +' versions';
                    } else {
                        s += 'Click to return to browser brands';
                    }
                    return s;
                }
            },
            series: [{
                name: name,
                data: data,
                color: 'white'
            }],
            exporting: {
                enabled: false
            }
        });
    });
    
});
		</script>


<script src="${basePath }js/Highcharts/highcharts.js"></script>
<script src="${basePath }js/Highcharts/modules/exporting.js"></script>

<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  		
  	</div>
</div>
</div>
</div>
  </body>
</html>
