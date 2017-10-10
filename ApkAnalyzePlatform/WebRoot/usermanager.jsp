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
		<title>用户管理</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="css/style.css" type="text/css" > 
    	<link href="css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css" />
		<!--Import Google Icon Font-->
		<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
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
System.out.println(username+" "+is_admin);
int un_read_num=0;
Session session3=HibernateSessionFactory.getSession();
Transaction tx3 = session3.beginTransaction();
//----------------------------------------------
Message message = new Message();  
Query q3 = session3.createQuery("from Message where receiver_id = ?");  
q3.setParameter(0, user_id.toString());
System.out.println("user_id = "+user_id.toString());
List<Message> list3=q3.list();
System.out.println("list size = "+list3.size());
for(int i=0;i<list3.size();i++)
{
	if(!list3.get(i).getIsRead())
		un_read_num++;
}
System.out.println(un_read_num);
tx3.commit();
HibernateSessionFactory.closeSession();
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
          <li><a class="btn-floating pink" href="usermanager.jsp"><i class="large mdi mdi-18px mdi-light mdi-account-edit"></i></a></li>
      <li><a class="btn-floating red" href="statistic.jsp"><i class="large mdi mdi-18px mdi-light mdi-chart-bar"></i></a></li>
      <li><a class="btn-floating yellow darken-1" href="message.jsp"><i class="large mdi mdi-18px mdi-light mdi-message"></i></a></li>
      <li><a class="btn-floating green" href="upload.jsp"><i class="large mdi mdi-18px mdi-light mdi-upload"></i></a></li>
      <li><a class="btn-floating blue" href="dashboard.jsp"><i class="large mdi mdi-18px mdi-light mdi-view-dashboard"></i></a></li>
    </ul>
  </div>


		<header>
			<nav class="top-nav z-depth-2 hoverable">
				<div class="container">
					<div class="nav-wrapper">
						<span class="flow-text left-align">用户管理</span>
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
				<li class="bold">
					<a href="user_statistics_charts.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-account-card-details"></i> 用户统计</a>
				</li>
				<%if((Boolean)is_admin){ %>
				<li class="bold active red lighten-4">
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
				<div class="row col s12">
        <form action = "/ApkAnalyzePlatform/usermanagerpattern" method = "post">
					<!--*********************************-->
					<div class="card col s12">
					<table class="centered col s12">
        <thead>
          <tr>
              <th>选中用户</th>
              <th>用户id</th>
              <th>用户名</th>
              <th>是否拥有下载权限</th>
              <th>是否拥有上传权限</th>
              <th>是否为管理员</th>
              <th>上传文件大小</th>
          </tr>
        </thead>

        <tbody>
          <!--、、、、、、、、、、、、、、、、、、、、、、、、、、、、-->
          <%
        Session session2 = HibernateSessionFactory.getSession();
        Transaction tx2 = session2.beginTransaction();
        String hql = "from User";
        Query q = session2.createQuery(hql);
        List<User> list = q.list();
        %>
        <% 
        for(int i = 0;i < list.size();i ++)
        {
        	if(list.get(i).getUserId()==(Integer)user_id) continue;
            %>
            <tr>
                <td><input id="<%=list.get(i).getUserId()%>1" name = "delete" type = "checkbox" class="filled-in" value = "<%=list.get(i).getUserId()%>"/><label for="<%=list.get(i).getUserId()%>1" ></label></td>
                <td><%=list.get(i).getUserId()%></td>
                <td><%=list.get(i).getUsername()%></td>
                <%if(list.get(i).getDownload() == true){ %>
                <td><input id="<%=list.get(i).getUserId()%>2"  name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "download" checked/><label for="<%=list.get(i).getUserId()%>2" ></label> </td>
                <%}else{ %>
                <td><input id="<%=list.get(i).getUserId()%>3"  name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "download"/><label for="<%=list.get(i).getUserId()%>3" ></label> </td>
                <%}
                if(list.get(i).getUpload() == true){ 
                %>
                <td><input id="<%=list.get(i).getUserId()%>4"  name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "upload"checked/><label for="<%=list.get(i).getUserId()%>4" ></label> </td>
                <%} else {%>
                <td><input id="<%=list.get(i).getUserId()%>5"  name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "upload"/><label for="<%=list.get(i).getUserId()%>5" ></label> </td>
                <%}
                if(list.get(i).getIsAdmin() == true){ 
                %>
                <td><input id="<%=list.get(i).getUserId()%>6"  name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "is_admin" checked/><label for="<%=list.get(i).getUserId()%>6" ></label> </td>
                <%}
                else { %>
                <td><input id="<%=list.get(i).getUserId()%>7"  name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "is_admin"/><label for="<%=list.get(i).getUserId()%>7" ></label>  </td>
                <%} %>
                <%String temp_name="filesize"+Integer.toString(list.get(i).getUserId() ); %>
                <td> 允许上传大小（MB）： &nbsp;<%=list.get(i).getFileSize()%> <br>下方输入新值<input id="<%=list.get(i).getUserId()%>8"  name = <%=temp_name %> type = "text"/><label for="<%=list.get(i).getUserId()%>8" ></label></td>
                <%System.out.println("filesize" + Integer.toString(list.get(i).getUserId() )); %>
            </tr><br>
         <%
         }
         %>
                 
          <!--、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、-->
        </tbody>
      </table>
					
					</div>
					<!--*************************************-->
		<div class="col s12">
			<div class="col s4">
         <input name = "Submit" type = "submit" value = "修改" onclick="Materialize.toast('权限已修改', 4000)" class="btn"/>
			</div>
			<div class="col s4">
         <input name = "Submit" type = "submit" value = "删除" onclick="Materialize.toast('用户已删除', 4000)" class="btn"/>
			</div>
			<div class="col s4">
         <input name = "reset" type = "reset" class="btn"/>
			</div>
		</div>  
                              
         </form>
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