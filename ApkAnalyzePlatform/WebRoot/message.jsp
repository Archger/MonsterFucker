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
		<title>消息通知</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="css/style.css" type="text/css" > 
		<!--Import Google Icon Font-->
		<link href="css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css" />
		<!--Import materialize.css-->
		<link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<script type="text/javascript" src="FusionCharts/js/fusioncharts.js"></script>
		<script type="text/javascript" src="FusionCharts/js/themes/fusioncharts.theme.fint.js"></script>


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

Query upm = session2.createQuery("update Message set is_read = ? where receiver_id = ?");
upm.setParameter(0, true);
upm.setParameter(1, user_id);
upm.executeUpdate();
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
						<span class="flow-text left-align">消息通知</span>
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
				<li class="bold active red lighten-4">
					<a href="message.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-message"></i>消息通知<%if(un_read_num>0){%><span class="new badge blue lighten-1"><%=un_read_num %></span><%}%></a>
				</li>
				<li class="bold">
					<a href="statistic.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-chart-line"></i> Apk统计</a>
				</li>
				<li class="bold">
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
						<div id="message" class="section scrollspy">
							<!--start-->
							<div class="row">
								<div class="col s12 m6 l6">
									<p class="flow-text">用户留言</p>
									<ul class="collapsible popout" data-collapsible="accordion">
										<%
                	 	if(list.size()==0)
                	 	{
                	 		%>
										<p> 暂时没有消息</p>
										<%
                	 	}
				        else if(list.size()>0)
				        { 
				        	  int num2=0;
				        	 for(int i=0;i<list.size();i++)
				        	 { 
				        	 	Integer sendid = list.get(i).getSenderId();
				        	 	q=session2.createQuery("from User where user_id = ?");
				        	 	System.out.println("send_id = "+sendid.toString()+"ok");
				        	 	q.setString(0, sendid.toString());
				        	 	List<User> list2=q.list();
				        	 	if(list2.size()>0){
				        	 	String from = list2.get(0).getUsername();
				        	 	if(!list2.get(0).getIsAdmin()){
				        	 	num2++;
				        	 %>
										<li>
											<div class="collapsible-header"><i class="large mdi mdi-24px mdi-dark mdi-message-processing"></i>来自
												<%=from%>
											</div>
											<div class="collapsible-body">
												<p>
													<%=list.get(i).getContent() %>
												</p>
											</div>
										</li>
										<% 		}
				        		}
				        		//System.out.println("********num = "+num);
				        	}
				        	
				        		if(num2==0)
				        		{
				        			%>
										<p> 暂时没有消息</p>
										<%
				        		}
				        }
                	  %>
									</ul>

								</div>
								<div class="col s12 m6 l6">
									<p class="flow-text">系统通知</p>
									<ul class="collapsible popout" data-collapsible="accordion">
										<%
                	 if(list.size()==0)
                	 	{
                	 		%>
										<p> 暂时没有通知</p>
										<%
                	 	}
				        if(list.size()>0)
				        {  
				        	int num=0;
				        	 for(int i=0;i<list.size();i++)
				        	 { 
				        	 	Integer sendid = list.get(i).getSenderId();
				        	 	q=session2.createQuery("from User where user_id = ?");
				        	 	q.setString(0, sendid.toString());
				        	 	List<User> list2=q.list();
				        	 	if(list2.size()>0){
				        	 	String from = list2.get(0).getUsername();
				        	 	if(list2.get(0).getIsAdmin())
				        	 	{ num++;
				        	 	%>
										<li>
											<div class="collapsible-header"><i class="large mdi mdi-24px mdi-dark mdi-message-text"></i>来自
												<%=from%>
											</div>
											<div class="collapsible-body">
												<p>
													<%=list.get(i).getContent() %>
												</p>
											</div>
										</li>
										<%}}
				        	 }
				        	 if(num==0)
				        	 {
				        	 	%>
										<p> 暂时没有通知</p>
										<%
				        	 }
				        }
						tx2.commit();
        				HibernateSessionFactory.closeSession();
                	  %>
									</ul>

								</div>

							</div>

							<!--end-->
						</div>
						<div id="leave" class="section scrollspy">
							<!--stary-->
							<br />
							<div class="divider"></div>
							<br />
							<div class="row">
								<div class="card col s12 hoverable z-depth-2">
									<br />
									<form class="col s12" action="/ApkAnalyzePlatform/messagepatten" method="post">
										<div class="row">
											<div class="input-field col s2">
												<input placeholder="用户名" id="receiver_id" name="to" type="text" class="validate">
												<label for="receiver_id">接收方：</label>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="input-field col s11">
												<textarea placeholder="留言内容" id="content" name="content" class="materialize-textarea"></textarea>
												<label for="content">留言：</label>
											</div>
										</div>
										<input type="submit" value="留言" onclick="Materialize.toast('留言已发送', 4000)" class="right btn" />
										<!--<a class="col s1 btn waves-effect waves-light right">留言</a>-->
										<br />
									</form>
									<br />
								</div>

							</div>
							<br />
							<!--end-->
						</div>
					</div>
					<div class="col hide-on-small-only m3 l2">
						<ul class="section table-of-contents side-nav-bar">
							<li>
								<a href="#message">消息</a>
							</li>
							<li>
								<a href="#leave">留言</a>
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
					Copyright MonsterFighter Team © 2017 All rights reserved.
					<span class="right"> Design and Developed by  MonsterFighter</span>
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