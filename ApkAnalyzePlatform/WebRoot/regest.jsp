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
		<title>Sign up</title>
		<meta charset="utf-8" />
		<!--Import Google Icon Font-->
		<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
		<!--Import materialize.css-->
		<link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<style>
			body {
				background-image: url(images/loginback.jpg);
				display: flex;
				min-height: 100vh;
				flex-direction: column;
			}
			
			main {
				flex: 1 0 auto;
			}
			.card{
				opacity: 0.7;
			}
		</style>

	</head>

	<body>

		<!--Import jQuery before materialize.js-->
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>

		<main>
			<br />
			<br />
			<br />
			<br />
			<br />
			<div class="container">
				<div class="row col s12">
					<div class="col s12 m3 l4"></div>
						<div class="card col s12 m6 l4 center-align hoverable">
							
							<br />
							<form class="col s12" action="/ApkAnalyzePlatform/regestpatten" method="post">
					    	<div class="row">
					        <div class="input-field col s12">
					          <input name="username" type="text" class="validate">
					          <label for="username" class="left-align black-text">账户</label>
					        </div>
					      </div>
					      <div class="row">
					        <div class="input-field col s12">
					          <input id="password" name="password" type="password" class="validate">
					          <label for="password" class="left-align black-text">密码</label>
					        </div>
					      </div>
					      <div class="row">
					        <div class="input-field col s12">
					          <input id="password2" name="password2" type="password" class="validate">
					          <label for="password2" class="left-align black-text">重复密码</label>
					        </div>
					      </div>
					      <div class="row">
						      <div class="input-field col s12">
						          <input id="email" name="email" type="email" class="validate">
						          <label for="email" class="left-align black-text">邮箱</label>
						        </div>
					       </div>
					       
						   <a href="login.jsp" class="left pink-text">登录</a>
					       <input type="submit" value="注册" class="right btn" />
					    
					    
					    <br />
					    <br />
					    
					  </div>
                	<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
						</div>
						<div class="col s12 m3 l4"></div>
				</div>
			</div>
		</main>


	</body>

</html>