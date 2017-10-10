<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.*"%>
<%@ page import="java.util.List" %>
<%@ page import="com.analysis.hibernate.Message"%>
<%@ page import="com.analysis.hibernate.User"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="com.analysis.cfg.HibernateSessionFactory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title>用户统计</title>
		<meta charset="utf-8" />
		<!--Import Google Icon Font-->
    	<link href="css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css" />
		<!--Import materialize.css-->
		<link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<script type="text/javascript" src="FusionCharts/js/fusioncharts.js"></script>
		<script type="text/javascript" src="FusionCharts/js/themes/fusioncharts.theme.fint.js"></script>

		<style>
			.side-nav-bar {
				position: fixed !important;
			}
			
			header,
			main,
			footer {
				padding-left: 300px;
			}
			
			@media only screen and (max-width: 992px) {
				header,
				main,
				footer {
					padding-left: 0;
				}
			}
			
			body {
				background-image: url(images/back_demo.jpg);
				display: flex;
				min-height: 100vh;
				flex-direction: column;
			}
		
			main {
				flex: 1 0 auto;
			}
			
		</style>
<%
    	Session se= HibernateSessionFactory.getSession();
    %>
     <!-- 权限统计 -->
    <%
    		
			Transaction tx2=se.beginTransaction();
			//-------------------------------------------------------
			String adminHQL="select count(userId) from User where isAdmin=true";
			String uploadHQL="select count(userId) from User where upload=1";
			String downloadHQL="select count(userId) from User where download=1";
			Query adminQuery=se.createQuery(adminHQL);
			Query uploadQuery=se.createQuery(uploadHQL);
			Query downloadQuery=se.createQuery(downloadHQL);
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
	        width: '100%',
	        height: '100%',
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
	
	   <!-- 上传时间 -->
      <%
      Transaction tx3=se.beginTransaction();
			//-------------------------------------------------------
			String sql="SELECT DATE_FORMAT(register_date,'%Y-%m') as month, count(user_id) FROM user where register_date>DATE_SUB(CURDATE(), INTERVAL 7 MONTH) group by month";
			SQLQuery sqlQuery=se.createSQLQuery(sql);
			List<Object[]> list=sqlQuery.list();%>
			<script>
			FusionCharts.ready(function(){
			    var salesChart = new FusionCharts({
			        type: 'scrollline2d',
			        dataFormat: 'json',
			        renderAt: 'date',
			        width: '100%',
			        height: '100%',
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
	</head>

	<body>
		<!--java start-->
		<%
//request.setCharacterEncoding("utf-8");
Object user_id=request.getSession().getAttribute("user_id");
Object username=request.getSession().getAttribute("username");
Object is_admin=request.getSession().getAttribute("is_admin");
Object upload=request.getSession().getAttribute("upload");
Object download=request.getSession().getAttribute("download");
int un_read_num=0;
Session session7=HibernateSessionFactory.getSession();
Transaction tx7 = session7.beginTransaction();
//----------------------------------------------
Message message = new Message();  
Query q7 = session7.createQuery("from Message where receiver_id = ?");  
q7.setParameter(0, user_id.toString());
List<Message> list7=q7.list();
for(int i=0;i<list7.size();i++)
{
	if(!list7.get(i).getIsRead())
		un_read_num++;
}
tx7.commit();
 %>
		<!--java end-->

		<!--Import jQuery before materialize.js-->
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>
		
		 <div class="fixed-action-btn">
    <a class="btn-floating btn-large red">
      <i class="large mdi mdi-24px mdi-light mdi-pencil"></i>
    </a>
    <ul>
    <%if((Boolean)is_admin){%> <li><a class="btn-floating pink" href="usermanager.jsp"><i class="large mdi mdi-18px mdi-light mdi-account-edit"></i></a></li><%} %>
     <li><a class="btn-floating red" href="statistic.jsp"><i class="large mdi mdi-18px mdi-light mdi-chart-bar"></i></a></li>
      <li><a class="btn-floating yellow darken-1" href="message.jsp"><i class="large mdi mdi-18px mdi-light mdi-message"></i></a></li>
     <%if((Boolean)upload){%><li><a class="btn-floating green" href="upload.jsp"><i class="large mdi mdi-18px mdi-light mdi-upload"></i></a></li><%} %> 
      <li><a class="btn-floating blue" href="dashboard.jsp"><i class="large mdi mdi-18px mdi-light mdi-view-dashboard"></i></a></li>
    </ul>
  </div>

		<header>
			<nav class="top-nav z-depth-2 hoverable">
				<div class="container">
					<div class="nav-wrapper">
						<span class="flow-text left-align">用户统计</span>
					</div>
				</div>
			</nav>

			<ul id="slide-out" class="side-nav fixed z 	-depth-4 hoverable">
				<li class="logo"> <img src="images/logo2.1.png" class="responsive-img" /> </li>
				<li>
					<div class="userView  row col s12">
						<div class="background">
							<img src="images/user.jpg" class="responsive-img">
						</div>

						
						<div class="col s12">
							<span class>
				  	  	<!-- Dropdown Trigger -->
						  <a class='dropdown-button black-text left ' data-activates='dropdownuser'><%=username %></a>
						
						  <!-- Dropdown Structure -->
						  <ul id='dropdownuser' class='dropdown-content'>
						    <li><a href="/ApkAnalyzePlatform/signoutpatten">退出登录</a></li>
						  </ul>
				  	  </span></div>
						<div class="col s12" >
							<span class="black-text"><%
                                if((Boolean)is_admin)
                                {
                                	%>管理员<%
                                }
                                else
                                {
                                	%>用户<%
                                }
                                 %></span></div>

					</div>

				</li>
				<li class="bold">
					<a href="dashboard.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-view-dashboard"></i>首页</a>
				</li>
				<%if((Boolean)upload){ %>
				<li class="bold">
					<a href="upload.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-upload"></i> 文件上传</a>
				</li><%} %>
				<li class="bold">
					<a href="message.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-message"></i>消息通知<%if(un_read_num>0){%><span class="new badge blue lighten-1"><%=un_read_num %></span><%}%></a>
				</li>
				<li class="bold">
					<a href="statistic.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-chart-line"></i> Apk统计</a>
				</li>
				<li class="bold active red lighten-4">
					<a href="user_statistics_charts.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-account-card-details"></i> 用户统计</a>
				</li>
				<%if((Boolean)is_admin){ %>
				<li class="bold">
					<a href="usermanager.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-account-edit"></i> 用户管理</a>
				</li><%} %>
				<li class="bold">
					<a href="search.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-magnify"></i> 查找</a>
				</li>

				<li class="li-hover">
					<div class="divider"></div>
				</li>
				<li class="li-hover">
					<p class="ultra-small margin more-text">MORE</p>
				</li>
				<li>
					<a href="aboutus.jsp"><i class="large mdi mdi-24px mdi-dark mdi-information-outline"></i>关于我们</a>
				</li>
			</ul>
		</header>
		<main>
			<div class="container">

				<!--right start-->
				<div class="row">
					<div class="col s12 m9 l10">
						<div id="introduction" class="section scrollspy">
							<!--start-->
							  <!-- 用户总数 -->
    <%
			Transaction tx1=se.beginTransaction();
			//-------------------------------------------------------
			String hql="select count(userId) from User";
			Query query=se.createQuery(hql);
			Long totalNum= (Long) query.uniqueResult();%>
			<p class="flow-text center">用户总数：<%= totalNum%></p>
			<%
			//-------------------------------------------------------
			tx1.commit();
			HibernateSessionFactory.closeSession();

     %>
        <div id="permission" class="col s10">正在加载</div>
							<!--end-->
						</div>
						<div class="row">
						<br>
						<div class="diver"></div>
						<br>
						</div>
						<div id="structure" class="section scrollspy">
        <div id="date" class="col s10">正在加载</div>

						</div>
						
					</div>
				</div>
				<!--right end-->

			</div>
		</main>

		<!--foot start-->
		<footer class="page-footer">
			<div class="footer-copyright">
				<div class="container">
					Copyright MonsteFighter Team © 2017 All rights reserved.
					<span class="right"> Design and Developed by  MonsterFighter</span>
				</div>
			</div>
		</footer>
		<!--foot end-->

	</body>
	<script type="text/javascript">
	$(document).ready(function() {
			$('.scrollspy').scrollSpy();
		});
	</script>

</html>