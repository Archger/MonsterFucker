<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.hibernate.Query" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="java.util.List" %>
<%@ page import="com.analysis.hibernate.Message"%>
<%@ page import="com.analysis.hibernate.User"%>
<%@ page import="com.analysis.hibernate.Apk"%>
<%@ page import="com.analysis.cfg.HibernateSessionFactory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	
<head>
	<meta charset="utf-8"> 
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <title>分析结果</title>

    <!-- CORE CSS-->    
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection">

    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!--<style>
	html{height:100%;}
body{min-height:100%;margin:0;padding:0;position:relative;}

header{background-color: #ffe4c4;}
main{padding-bottom:100px;background-color: #bdb76b;}/* main的padding-bottom值要等于或大于footer的height值 */
footer{position:absolute;bottom:0;width:100%;height:100px;background-color: #ffc0cb;}
</style>-->
</head>

<body>
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


		<!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    
    <!-- Start Page Loading -->
    <!--<div id="loader-wrapper">
        <div id="loader"></div>        
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>-->
    <!-- End Page Loading -->

    <!-- //////////////////////////////////////////////////////////////////////////// -->
    
  
    <!-- START HEADER -->
    <header id="header" class="page-topbar">
        <!-- start header nav-->
        <div class="navbar-fixed">
            <nav class="cyan">
                <div class="nav-wrapper">
                    <h4 class="logo-wrapper">AnalyzeSystem</h4>
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
        	<div class="row">
        		<div class="col s1">
        			<aside id="left-sidebar-nav">
                <ul id="slide-out" class="side-nav fixed leftside-navigation">
                    <li class="user-details cyan darken-2">
                        <div class="row">
                            <div class="col col s8 m8 l8">
                            
                            <!--选项-->
                         
                                <!--用户名-->
                                <a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" data-activates="profile-dropdown"><%=username %></a>
                                
                                <!--用户权限-->
                                <p class="user-roal"><%
                                if((Boolean)is_admin)
                                {
                                	%>管理员<%
                                }
                                else
                                {
                                	%>用户<%
                                }
                                 %></p>              
                                
                            </div>
                        </div>
                    </li>
                    <li class="bold"><a href="dashboard.jsp" class="waves-effect waves-cyan"><i class="material-icons">toc</i> 控制台</a>
                    </li>
                    <li class="bold"><a href="upload.jsp" class="waves-effect waves-cyan"><i class="material-icons">present_to_all</i> 文件上传</a>
                    </li>
                    <li class="bold"><a href="message.jsp" class="waves-effect waves-cyan"><i class="material-icons">message</i>消息通知</a>
                    </li>
                    <li class="bold"><a href="statistic.jsp" class="waves-effect waves-cyan"><i class="material-icons">assessment</i> 统计管理</a>
                    </li>
                    <li class="bold"><a href="usermanager.jsp" class="waves-effect waves-cyan"><i class="material-icons">perm_identity</i> 用户管理</a>
                    </li>
                    <li class="bold active teal lighten-4"><a href="search.jsp" class="waves-effect waves-cyan"><i class="material-icons">search</i> 查找</a>
                    </li>

                    <li class="li-hover"><div class="divider"></div></li>
                    <li class="li-hover"><p class="ultra-small margin more-text">MORE</p></li>
                    <li><a href="help.jsp"><i class="material-icons">star</i>帮助</a>
                    </li>                  
                    <li>
                    <a href="aboutus.jsp"><i class="material-icons">turned_in</i>关于我们</a>
                    </li>
                    <li class="li-hover"><div class="divider"></div></li>
                    
                    
                    <!--登录统计-->
                    <li class="li-hover"><p class="ultra-small margin more-text">登录统计</p></li>
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
            </aside>
        		</div>
        		
        		<div class="col s11">
        			<!-- START CONTENT -->
            <section id="content">

                <!--start container-->
                <div class="container">
               			
                	
                </div>
                <!--end container-->
            </section>
            <!-- END CONTENT -->
        		</div>
        		
        	</div>

            <!-- //////////////////////////////////////////////////////////////////////////// -->

            

            <!-- //////////////////////////////////////////////////////////////////////////// -->
            

        </div>
        <!-- END WRAPPER -->

    </div>
    <!-- END MAIN -->
    
    <br />
<br />
<br />
    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START FOOTER -->
    <footer class="page-footer">
          <div class="container">
             Copyright MonsterFucker Team © 2017   All rights reserved.
          </div>
          <br />
          <div class="footer-copyright">
            <div class="container">
            © Design and Developed by MonsterFucker
            </div>
          </div>
        </footer>
    <!-- END FOOTER -->

</body>

</html>
