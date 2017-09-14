<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<!--================================================================================
	Item Name: Apk analyze system
	Version: 1.0
	Author: MonsterFucker Team
	
================================================================================ -->

<head>
	<meta charset="utf-8"> 
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <title>Sign up</title>

    <!-- CORE CSS-->    
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">

    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>
	html{height:100%;}
body{min-height:100%;margin:0;padding:0;position:relative;}

header{background-color: #ffe4c4;}
main{padding-bottom:100px;background-color: #bdb76b;}/* main的padding-bottom值要等于或大于footer的height值 */
footer{position:absolute;bottom:0;width:100%;height:100px;background-color: #ffc0cb;}
</style>
</head>

<body>
		<!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    
    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START HEADER -->
    <header id="header" class="page-topbar">
        <!-- start header nav-->
        <div class="navbar-fixed">
            <nav class="cyan">
                <div class="nav-wrapper">
                    <h4 class="logo-wrapper">
                    	<!--AnalyzeSystem-->
                    	AnalyzeSystem
                    </h4>
                </div>
            </nav>
        </div>
        <!-- end header nav-->
    </header>
    <!-- END HEADER -->

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START MAIN -->
    <div id="main">
        <!-- START WRAPPER -->
        <div class="wrapper">

            <!-- START LEFT SIDEBAR NAV-->
            
            <!-- END LEFT SIDEBAR NAV-->

            <!-- //////////////////////////////////////////////////////////////////////////// -->

            <!-- START CONTENT -->
            <section id="content">

                <!--start container-->
                <div class="container">
                	
                	
                	
                	<div class="row">
                		<br />
                		<br />
                		<br />
                		<form class="col s12" action="/ApkAnalyzePlatform/regestpatten" method="post">
					    <div class="col s12 m6 l4 center-align">
					    	<div class="row">
					        <div class="input-field col s12">
					          <input placeholder="用户名/邮箱" name="username" type="text" class="validate">
					          <label for="username">账户</label>
					        </div>
					      </div>
					      <div class="row">
					        <div class="input-field col s12">
					          <input id="password" name="password" type="password" class="validate">
					          <label for="password">密码</label>
					        </div>
					      </div>
					      <div class="row">
					        <div class="input-field col s12">
					          <input id="password2" name="password2" type="password" class="validate">
					          <label for="password2">重复密码</label>
					        </div>
					      </div>
					      <div class="row">
						      <div class="input-field col s12">
						          <input id="email" name="email" type="email" class="validate">
						          <label for="email">邮箱</label>
						        </div>
					       </div>
					      <!--<a href="/ApkAnalyzePlatform/loginJudgepatten" class="btn waves-effect right hoverable">登录</a>-->
					      <input type="submit" value="注册" class="right"  />
					    </div>
					    
					    <br />
					    <br />
					    <br />
					    
					  </div>
                	
                </div>
                   
                </div>
                <!--end container-->
            </section>
            <!-- END CONTENT -->

            <!-- LEFT RIGHT SIDEBAR NAV-->

        </div>
        <!-- END WRAPPER -->

    </div>
    <!-- END MAIN -->

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START FOOTER -->
    
    <footer class="page-footer">
          <div class="container">
             Copyright MonsterFucker Team © 2017   All rights reserved.
          </div>
          <div class="footer-copyright">
            <div class="container">
            © Design and Developed by MonsterFucker
            </div>
          </div>
        </footer>
    <!-- END FOOTER -->
</body>

</html>
