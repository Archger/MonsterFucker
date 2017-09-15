<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.hibernate.Query" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="com.analysis.hibernate.Message"%>
<%@ page import="com.analysis.hibernate.User"%>
<%@ page import="com.analysis.cfg.HibernateSessionFactory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title>Upload</title>
		<meta charset="utf-8" />
		<!--Import Google Icon Font-->
		<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
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
				display: flex;
				min-height: 100vh;
				flex-direction: column;
			}
			
			main {
				flex: 1 0 auto;
			}
		</style>

	</head>

	<body>
		<!--java start-->
		<%
//request.setCharacterEncoding("utf-8");
Object user_id=request.getSession().getAttribute("user_id");
Object username=request.getSession().getAttribute("username");
Object is_admin=request.getSession().getAttribute("is_admin");
//Object is_admin=request.getSession().getAttribute("is_admin");
//System.out.println(username+" "+is_admin);
int un_read_num=0;
Session session2=HibernateSessionFactory.getSession();
Transaction tx2 = session2.beginTransaction();
//----------------------------------------------
Message message = new Message();  
Query q = session2.createQuery("from Message where receiver_id = ?");  
q.setParameter(0, user_id.toString());
//System.out.println("user_id = "+user_id.toString());
List<Message> list=q.list();
//System.out.println("list size = "+list.size());
/*for(int i=0;i<list.size();i++)
{
	if(!list.get(i).getIsRead())
		un_read_num++;
}
System.out.println(un_read_num);*/
//tx2.commit();
//HibernateSessionFactory.closeSession();
 %>
		<!--java end-->

		<!--Import jQuery before materialize.js-->
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>

		<header>
			<nav class="top-nav">
				<div class="container">
					<div class="nav-wrapper">
						<span class="flow-text left-align">Upload</span>
					</div>
				</div>
			</nav>

			<ul id="slide-out" class="side-nav fixed">
				<li class="logo"> <img src="images/materialize-logo.png" /> </li>
				<li>
					<div class="userView">
						<div class="background">
							<img src="images/user-bg.jpg">
						</div>
						<img class="circle" src="images/sample4.jpg">
						<span class="white-text name"><%=username %></span>
						<span class="white-text"><%
                                if((Boolean)is_admin)
                                {
                                	%>管理员<%
                                }
                                else
                                {
                                	%>用户<%
                                }
                                 %></span>
					</div>
				</li>
				<li class="bold">
					<a href="dashboard.jsp" class="waves-effect waves-cyan"><i class="material-icons">toc</i> 控制台</a>
				</li>
				<li class="bold active teal lighten-4">
					<a href="upload.jsp" class="waves-effect waves-cyan"><i class="material-icons">present_to_all</i> 文件上传</a>
				</li>
				<li class="bold">
					<a href="message.jsp" class="waves-effect waves-cyan"><i class="material-icons">message</i>消息通知</a>
				</li>
				<li class="bold">
					<a href="statistic.jsp" class="waves-effect waves-cyan"><i class="material-icons">assessment</i> 统计管理</a>
				</li>
				<li class="bold">
					<a href="usermanager.jsp" class="waves-effect waves-cyan"><i class="material-icons">perm_identity</i> 用户管理</a>
				</li>
				<li class="bold">
					<a href="search.jsp" class="waves-effect waves-cyan"><i class="material-icons">search</i> 查找</a>
				</li>

				<li class="li-hover">
					<div class="divider"></div>
				</li>
				<li class="li-hover">
					<p class="ultra-small margin more-text">MORE</p>
				</li>
				<li>
					<a href="aboutus.jsp"><i class="material-icons">turned_in</i>关于我们</a>
				</li>
				<li class="li-hover">
					<div class="divider"></div>
				</li>

				<!--登录统计-->
				<li class="li-hover">
					<p class="ultra-small margin more-text">登录统计</p>
				</li>
				<li class="li-hover">
					<div class="row">
						<div class="col s12 m12 l12">
							<div class="sample-chart-wrapper">
								<div class="ct-chart ct-golden-section" id="ct2-chart"></div>
							</div>
						</div>
					</div>
				</li>

			</ul>
		</header>
		<main>
			<div class="container">

				<!--right start-->
				<div class="row">
					<div class="col s12 m9 l10">
						<div id="upload" class="section scrollspy">
							<!--start-->
								<form method="post" enctype="multipart/form-data" action="/ApkAnalyzePlatform/Upload">
									<div class="file-field input-field col s12">
										<div class="btn">
											<span>选择一个文件</span>
											<input type="file" name="uploadFile">
										</div>
										<div class="file-path-wrapper">
											<input class="file-path validate" type="text" name="uploadFile">
										</div>
									</div>

									<div class="input-field col s12">
										<select>
											<option value="" disabled selected>选择类型</option>
											<option value="系统工具">系统工具</option>
											<option value="桌面插件">桌面插件</option>
											<option value="资讯阅读">资讯阅读</option>
											<option value="社交聊天">社交聊天</option>
											<option value="影音娱乐">影音娱乐</option>
											<option value="生活服务">生活服务</option>
											<option value="实用工具">实用工具</option>
											<option value="文档商务">文档商务</option>
											<option value="金融财经">金融财经</option>
											<option value="运动健康">运动健康</option>
											<option value="学习教育">学习教育</option>
											<option value="出行交通">出行交通</option>
											<option value="其它">其它</option>
										</select>
										<label>选择app类型</label>
									</div>
									<div class="col s12">
										<input type="submit" value="上传" class="btn">
									</div>
								</form>

							<!--end-->
						</div>
					</div>
					<div class="col hide-on-small-only m3 l2">
						<ul class="section table-of-contents side-nav-bar">
							<li>
								<a href="#upload">上传</a>
							</li>
						</ul>
					</div>
				</div>
				<!--right end-->

			</div>
		</main>

		<!--foot start-->
		<footer class="page-footer">
			<div class="container">
				<div class="row">
					<div class="col l6 s12">
						<h5 class="white-text">联系我们</h5>
						<p class="grey-text text-lighten-4">QQ:xxxxxxxxxx</p>
						<p class="grey-text text-lighten-4">TEL:xxxxxxxxx</p>
					</div>
					<div class="col l4 offset-l2 s12">
						<h5 class="white-text">关于网站</h5>
						<ul>
							<li>
								<a class="grey-text text-lighten-3" href="#!">制作</a>
							</li>
							<li>
								<a class="grey-text text-lighten-3" href="#!">合作</a>
							</li>
							<li>
								<a class="grey-text text-lighten-3" href="#!">发展</a>
							</li>
							<li>
								<a class="grey-text text-lighten-3" href="#!">鸣谢</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="footer-copyright">
				<div class="container">
					Copyright MonsterFucker Team © 2017 All rights reserved.
					<span class="right"> Design and Developed by  MonsterFucker's</span>
				</div>
			</div>
		</footer>
		<!--foot end-->

	</body>

	<!--Script start-->
	<script type="text/javascript">
		$(document).ready(function() {
			$('.scrollspy').scrollSpy();
		});
	</script>

	<script>
		FusionCharts.ready(function() {
			var revenueChart = new FusionCharts({
				type: 'doughnut2d',
				renderAt: 'chart-container',
				width: '250',
				height: '250',
				dataFormat: 'json',
				dataSource: {
					"chart": {
						"caption": "Split of Revenue by Product Categories",
						"subCaption": "Last year",
						"numberPrefix": "$",
						"paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
						"bgColor": "#ffffff",
						"showBorder": "0",
						"use3DLighting": "0",
						"showShadow": "0",
						"enableSmartLabels": "0",
						"startingAngle": "310",
						"showLabels": "0",
						"showPercentValues": "1",
						"showLegend": "1",
						"legendShadow": "0",
						"legendBorderAlpha": "0",
						"defaultCenterLabel": "Total revenue: $64.08K",
						"centerLabel": "Revenue from $label: $value",
						"centerLabelBold": "1",
						"showTooltip": "0",
						"decimals": "0",
						"captionFontSize": "14",
						"subcaptionFontSize": "14",
						"subcaptionFontBold": "0"
					},
					"data": [{
							"label": "Food",
							"value": "28504"
						},
						{
							"label": "Apparels",
							"value": "14633"
						},
						{
							"label": "Electronics",
							"value": "10507"
						},
						{
							"label": "Household",
							"value": "4910"
						}
					]
				}
			}).render();
		});
	</script>
	<script>
		FusionCharts.ready(function() {
			var revenueChart = new FusionCharts({
				type: 'doughnut2d',
				renderAt: 'chart-container2',
				width: '250',
				height: '250',
				dataFormat: 'json',
				dataSource: {
					"chart": {
						"caption": "Split of Revenue by Product Categories",
						"subCaption": "Last year",
						"numberPrefix": "$",
						"paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
						"bgColor": "#ffffff",
						"showBorder": "0",
						"use3DLighting": "0",
						"showShadow": "0",
						"enableSmartLabels": "0",
						"startingAngle": "310",
						"showLabels": "0",
						"showPercentValues": "1",
						"showLegend": "1",
						"legendShadow": "0",
						"legendBorderAlpha": "0",
						"defaultCenterLabel": "Total revenue: $64.08K",
						"centerLabel": "Revenue from $label: $value",
						"centerLabelBold": "1",
						"showTooltip": "0",
						"decimals": "0",
						"captionFontSize": "14",
						"subcaptionFontSize": "14",
						"subcaptionFontBold": "0"
					},
					"data": [{
							"label": "Food",
							"value": "27404"
						},
						{
							"label": "Apparels",
							"value": "165633"
						},
						{
							"label": "Electronics",
							"value": "145607"
						},
						{
							"label": "Household",
							"value": "89910"
						}
					]
				}
			}).render();
		});
	</script>

	<!--Script End-->

</html>