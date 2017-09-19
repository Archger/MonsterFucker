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
		<title>Login in</title>
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
							<br>
							<form class="col s12" action="/ApkAnalyzePlatform/loginJudgepatten" method="post">
								<div class="row">
									<div class="input-field col s12">
										<!--<input placeholder="用户名/邮箱" name="username" type="text" class="validate">-->
										<input name="username" type="text" class="validate">
										<label for="username" class="black-text left-align">账户</label>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s12">
										<input id="password" name="password" type="password" class="validate">
										<label for="password" class="black-text left-align">密码</label>
									</div>
								</div>
								<br>
								<br>
								<a href="regest.jsp" class="left pink-text">注册</a>
								<!--<a href="/ApkAnalyzePlatform/loginJudgepatten" class="btn waves-effect right hoverable">登录</a>-->
								<input type="submit" value="登录" class="right btn" />

							</form>
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