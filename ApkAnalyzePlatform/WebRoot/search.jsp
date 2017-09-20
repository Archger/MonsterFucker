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
		<title>Search</title>
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
				background-image: url(images/loginback3.jpg);
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
System.out.println(username+" "+is_admin);
int un_read_num=0;
Session session2=HibernateSessionFactory.getSession();
Transaction tx2 = session2.beginTransaction();
//----------------------------------------------
Message message = new Message();  
Query q = session2.createQuery("from Message where receiver_id = ?");  
q.setParameter(0, user_id.toString());
System.out.println("user_id = "+user_id.toString());
List<Message> list=q.list();
System.out.println("list size = "+list.size());
for(int i=0;i<list.size();i++)
{
	if(!list.get(i).getIsRead())
		un_read_num++;
}
System.out.println(un_read_num);
tx2.commit();
HibernateSessionFactory.closeSession();
 %>
		<!--java end-->

		<!--Import jQuery before materialize.js-->
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>

		<div class="fixed-action-btn">
			<a class="btn-floating btn-large red">
				<i class="large material-icons">mode_edit</i>
			</a>
			<ul>
				<li>
					<a class="btn-floating red" href="statistic.jsp"><i class="material-icons">insert_chart</i></a>
				</li>
				<li>
					<a class="btn-floating yellow darken-1" href="message.jsp"><i class="material-icons">question_answer</i></a>
				</li>
				<li>
					<a class="btn-floating green" href="upload.jsp"><i class="material-icons">publish</i></a>
				</li>
				<li>
					<a class="btn-floating blue" href="dashboard.jsp"><i class="material-icons">perm_identity</i></a>
				</li>
			</ul>
		</div>

		<header>
			<nav class="top-nav z-depth-2 hoverable">
				<div class="container">
					<div class="nav-wrapper">
						<span class="flow-text left-align">Search</span>
					</div>
				</div>
			</nav>

			<ul id="slide-out" class="side-nav fixed z-depth-4 hoverable">
				<li class="logo"> <img src="images/materialize-logo.png" /> </li>
				<li>
					<div class="userView row col s12">
						<div class="background">
							<img src="images/user.jpg" class="responsive-img">
						</div>

						<div class="col s12">
							<div class="col s1"></div>
							<div class="col s10">
								<img class="circle responsive-img" src="images/sample4.jpg">
							</div>
							<div class="col s1"></div>
						</div>
						<div class="col s12">
							<span>
				  	  	<!-- Dropdown Trigger -->
						  <a class='dropdown-button black-text left' data-activates='dropdownuser'><%=username %></a>
						
						  <!-- Dropdown Structure -->
						  <ul id='dropdownuser' class='dropdown-content'>
						    <li><a href="/ApkAnalyzePlatform/signoutpatten">退出登录</a></li>
						  </ul>
				  	  </span></div>
						<div class="col s12">
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
					<a href="dashboard.jsp" class="waves-effect waves-cyan"><i class="material-icons">toc</i> 控制台</a>
				</li>
				<li class="bold">
					<a href="upload.jsp" class="waves-effect waves-cyan"><i class="material-icons">present_to_all</i> 文件上传</a>
				</li>
				<li class="bold">
					<a href="message.jsp" class="waves-effect waves-cyan"><i class="material-icons">message</i>消息通知
						<%if(un_read_num>0){%><span class="new badge blue lighten-1"><%=un_read_num %></span>
						<%}%>
					</a>
				</li>
				<li class="bold">
					<a href="statistic.jsp" class="waves-effect waves-cyan"><i class="material-icons">assessment</i> 统计管理</a>
				</li>
				<li class="bold">
					<a href="usermanager.jsp" class="waves-effect waves-cyan"><i class="material-icons">perm_identity</i> 用户管理</a>
				</li>
				<li class="bold active red lighten-4">
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
						<div id="easysearch" class="section scrollspy">
							<!--start-->
							<nav>
								<div class="nav-wrapper">
									<form>
										<div class="input-field z-depth-1">
											<input id="search" type="search" required="" />
											<label class="label-icon" for="search"><i class="material-icons">search</i></label>
											<i class="material-icons">close</i>
										</div>
									</form>
								</div>
							</nav>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<!--end-->
						</div>
						<div id="hexsearch" class="section scrollspy">
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>

						</div>
						<div id="selectapk" class="section scrollspy">
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>
							<p>内容 </p>

						</div>
					</div>
					<div class="col hide-on-small-only m3 l2">
						<ul class="section table-of-contents side-nav-bar">
							<li>
								<a href="#easysearch">简单查询</a>
							</li>
							<li>
								<a href="#hexsearch">混合查询</a>
							</li>
							<li>
								<a href="#selectapk">分类查询</a>
							</li>
						</ul>
					</div>
				</div>
				<!--right end-->

			</div>
		</main>

		<!--foot start-->
		<footer class="page-footer">
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

	<!--Script End-->

</html>