<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 

<%@page import="org.hibernate.*"%>
<%@page import="com.analysis.cfg.HibernateSessionFactory"%>
<%@page import="java.math.BigInteger"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_statistics_charts.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="FusionCharts/js/fusioncharts.js"></script>
<script type="text/javascript" src="FusionCharts/js/themes/fusioncharts.theme.fint.js"></script>

  </head>
  
  <body>
   
    <%
    	Session se= HibernateSessionFactory.getSession();
    %>
     <!-- 用户总数 -->
    <%
			Transaction tx1=se.beginTransaction();
			//-------------------------------------------------------
			String hql="select count(userId) from User";
			Query query=se.createQuery(hql);
			Long totalNum= (Long) query.uniqueResult();
			out.println("用户总数："+totalNum);
			//-------------------------------------------------------
			tx1.commit();

     %>
     <br><br>
     
     <!-- 权限统计 -->
    <%
    		
			Transaction tx2=se.beginTransaction();
			//-------------------------------------------------------
			String adminHQL="select count(userId) from User where admin=1";
			String uploadHQL="select count(userId) from User where upload=1";
			String downloadHQL="select count(userId) from User where download=1";
			Query adminQuery=se.createQuery(hql);
			Query uploadQuery=se.createQuery(hql);
			Query downloadQuery=se.createQuery(hql);
			Long adminNum= (Long)adminQuery.uniqueResult();
			Long uploadNum= (Long)uploadQuery.uniqueResult();
			Long downloadNum=(Long)downloadQuery.uniqueResult();
			//-------------------------------------------------------
			tx2.commit();
     %>
   <script>
	FusionCharts.ready(function(){
	    var myChart = new FusionCharts({
	        type: 'MSColumn2D',
	        dataFormat: 'json',
	        renderAt: 'permission',
	        width: '500',
	        height: '300',
	        dataSource: {
	            "chart": {
	                "caption": "用户权限统计图",
	                "subCaption": "",
	                "showBorder": "0",
	                "xAxisName": "权限",
	                "yAxisName": "用户数量",
	                "numberSuffix": "",
	                "baseFontColor" : "#333333",
	                "baseFont" : "Helvetica Neue,Arial",
	                "paletteColors" : "#69f0ae",
	                "bgColor" : "#ffffff",
	                "canvasBgColor" : "#ffffff",                                 
	                "captionFontSize" : "14",
	                "subcaptionFontSize" : "14",
	                "subcaptionFontBold" : "0",
	                "showBorder" : "0",
	                "showPlotBorder": "0",
	                "showXAxisLine" : "1",
	                "showLegend": "0",
	                "showShadow" : "1",
	                "showCanvasBorder" : "0",
	                "showAlternateHGridColor" : "0",
	                "usePlotGradientColor" :"0",
	                "divlineColor" : "#999999",
	                "divlineThickness" : "1",
	                "divLineIsDashed" : "1",
	                "divLineDashLen" : "1",
	                "divLineGapLen" : "1",
	                "xAxisLineThickness" : "1",
	                "xAxisLineColor" : "#999999",
	                "toolTipColor": "#ffffff",
	                "toolTipBorderThickness": "0",
	                "toolTipBgColor": "#000000",
	                "toolTipBgAlpha": "80",
	                "toolTipBorderRadius": "2",
	                "toolTipPadding": "5"
	            },
	      
	                "categories": [
	                {
	                  "category": [
	                        { "label": "管理员权限" },
							{ "label": "上传权限" },
							{ "label": "下载权限" }
	                    ]
	                }
	            ],
	            "dataset": [
	                {
	                    "seriesname": "Loading Time",
	                    "allowDrag": "0",
	                   "data": [
	              		    { "value": "<%= adminNum%>" },
	                        { "value": "<%= uploadNum%>" },
	       				    { "value": "<%= downloadNum%>" }
	                    ]
	                }
	            ]
	        }
	    }).render();
	});
	</script>
        <div id="permission"></div>
        
      <!-- 上传时间 -->
      <%
      Transaction tx3=se.beginTransaction();
			//-------------------------------------------------------
			String sql="SELECT DATE_FORMAT(register_date,'%Y-%m') as month, count(user_id) FROM user where register_date>DATE_SUB(CURDATE(), INTERVAL 3 MONTH) group by month";
			SQLQuery sqlQuery=se.createSQLQuery(sql);
			List<Object[]> list=sqlQuery.list();%>
			<script>
			FusionCharts.ready(function(){
			    var salesChart = new FusionCharts({
			        type: 'scrollline2d',
			        dataFormat: 'json',
			        renderAt: 'date',
			        width: '550',
			        height: '350',
			        dataSource: {
			            "chart": {
			                "caption": "注册时间统计图",
			                "subCaption": "",
			                "xAxisName": "月份",
			                "yAxisName": "注册用户数",
			                "showValues": "0",
			                "numberPrefix": "",
			                "showBorder": "0",
			                "showShadow": "1",
			                "bgColor": "#ffffff",
			                "paletteColors": "#69f0ae",
			                "showCanvasBorder": "0",
			                "showAxisLines": "0",
			                "showAlternateHGridColor": "0",
			                "divlineAlpha": "100",
			                "divlineThickness": "1",
			                "divLineIsDashed": "1",
			                "divLineDashLen": "1",
			                "divLineGapLen": "1",
			                "lineThickness": "3",  
			                "flatScrollBars": "1",
			                "scrollheight": "10",
			                "numVisiblePlot": "12",
			                "showHoverEffect":"1"
			            },
			            "categories": [
			                {
			                    "category": [
			                    <%for(Object[] item:list){%>
			                        { "label": "<%=(String)item[0]%>" },
			                        <%}%>
			                       
			                    ]
			                }
			            ],
			            "dataset": [
			                {
			                    "data": [
			                       <%for(Object[] item:list){%>
			                        { "value": "<%=(BigInteger)item[1]%>" },
			                        <%}%>
			                       
			                    ]
			                }
			            ]
			        }
			    }).render();
			});
			</script>
			<%
			//-------------------------------------------------------
			tx3.commit();
       %>
        <div id="date"></div>
  </body>
</html>
