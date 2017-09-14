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

<!--================================================================================
	Item Name: Apk analyze system
	Version: 1.0
	Author: MonsterFucker Team
	
================================================================================ -->

<head>
	<meta charset="utf-8"> 
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <title>Dashboard</title>

    <!-- CORE CSS-->    
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection">

    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
	<script type="text/javascript" src="FusionCharts/js/fusioncharts.js"></script>
	<script type="text/javascript" src="FusionCharts/js/themes/fusioncharts.theme.fint.js"></script>

<script>
	FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'doughnut2d',
        renderAt: 'chart-container',
        width: '450',
        height: '450',
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
            "data": [
                {
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
	FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'doughnut2d',
        renderAt: 'chart-container2',
        width: '450',
        height: '450',
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
            "data": [
                {
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

<style>
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


		<!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    
    <!-- Start Page Loading -->
    <div id="loader-wrapper">
        <div id="loader"></div>        
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>
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
                    <li class="bold active teal lighten-4"><a href="dashboard.jsp" class="waves-effect waves-cyan"><i class="material-icons">toc</i> 控制台</a>
                    </li>
                    <li class="bold"><a href="upload.jsp" class="waves-effect waves-cyan"><i class="material-icons">present_to_all</i> 文件上传</a>
                    </li>
                    <li class="bold"><a href="message.jsp" class="waves-effect waves-cyan"><i class="material-icons">message</i>消息通知<span class="new badge"><%=un_read_num %></span></a>
                    </li>
                    <li class="bold"><a href="statistic.jsp" class="waves-effect waves-cyan"><i class="material-icons">assessment</i> 统计管理</a>
                    </li>
                    <li class="bold"><a href="usermanager.jsp" class="waves-effect waves-cyan"><i class="material-icons">perm_identity</i> 用户管理</a>
                    </li>
                    <li class="bold"><a href="search.jsp" class="waves-effect waves-cyan"><i class="material-icons">search</i> 查找</a>
                    </li>

                    <li class="li-hover"><div class="divider"></div></li>
                    <li class="li-hover"><p class="ultra-small margin more-text">MORE</p></li>                
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
		
		                    <!--chart dashboard start-->
		                    <div id="chart-dashboard">
		                        <div class="row">
		                            <div class="col s12 m6 l6">
		                                <div class="card hoverable">
		                                    <div class="card-move-up">
		                                        <div id="chart-container">FusionCharts XT will load here!</div>
		                                        
		                                    </div>
		                                    <div class="card-content">
		                                        
		                                        FusionCharts XT will load here!
		                                    </div>
		
		                                    <div class="card-reveal">
		                                       FusionCharts XT will load here!2
		                                       
		                                    </div>
		
		
		                                </div>
		                            </div>
		
		                            <div class="col s12 m6 l6 hoverable">
		                                <div class="card">
		                                    <div class="card-move-up">
		                                        <div id="chart-container2">FusionCharts XT will load here!</div>
		                                        
		                                    </div>
		                                    <div class="card-content  teal darken-2">
		                                        
		                                        FusionCharts XT will load here!
		                                    </div>
		                                    <div class="card-reveal">
		                                        FusionCharts XT will load here!2
		                                        
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <!--chart dashboard end-->
		
		                    <!-- //////////////////////////////////////////////////////////////////////////// -->
		
		                    <!--card stats start-->
		                    <div id="card-stats">
		                        <div class="row">
		                            <div class="col s12 m6 l3">
		                                <div class="card">
		                                    <div class="card-content  green white-text">
		                                        <p class="card-stats-title"><i class="mdi-social-group-add"></i> New Clients</p>
		                                        <h4 class="card-stats-number">566</h4>	
		                                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> 15% <span class="green-text text-lighten-5">from yesterday</span>
		                                        </p>
		                                    </div>
		                                    <div class="card-action  green darken-2">
		                                        <div id="clients-bar"></div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col s12 m6 l3">
		                                <div class="card">
		                                    <div class="card-content purple white-text">
		                                        <p class="card-stats-title"><i class="mdi-editor-attach-money"></i>Total Sales</p>
		                                        <h4 class="card-stats-number">$8990.63</h4>
		                                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> 70% <span class="purple-text text-lighten-5">last month</span>
		                                        </p>
		                                    </div>
		                                    <div class="card-action purple darken-2">
		                                        <div id="sales-compositebar"></div>
		
		                                    </div>
		                                </div>
		                            </div>                            
		                            <div class="col s12 m6 l3">
		                                <div class="card">
		                                    <div class="card-content blue-grey white-text">
		                                        <p class="card-stats-title"><i class="mdi-action-trending-up"></i> Today Profit</p>
		                                        <h4 class="card-stats-number">$806.52</h4>
		                                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-up"></i> 80% <span class="blue-grey-text text-lighten-5">from yesterday</span>
		                                        </p>
		                                    </div>
		                                    <div class="card-action blue-grey darken-2">
		                                        <div id="profit-tristate"></div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="col s12 m6 l3">
		                                <div class="card">
		                                    <div class="card-content deep-purple white-text">
		                                        <p class="card-stats-title"><i class="mdi-editor-insert-drive-file"></i> New Invoice</p>
		                                        <h4 class="card-stats-number">1806</h4>
		                                        <p class="card-stats-compare"><i class="mdi-hardware-keyboard-arrow-down"></i> 3% <span class="deep-purple-text text-lighten-5">from last month</span>
		                                        </p>
		                                    </div>
		                                    <div class="card-action  deep-purple darken-2">
		                                        <div id="invoice-line"></div>
		                                    </div>
		                                </div>
		                            </div>                            
		                        </div>
		                    </div>
		                    <!--card stats end-->
		
		                    <!-- //////////////////////////////////////////////////////////////////////////// -->
		
		                    <!--card widgets start-->
		                    <div id="card-widgets">
		                        <div class="row">
		
		                            <div class="col s12 m12 l4">
		                                <ul id="task-card" class="collection with-header">
		                                    <li class="collection-header cyan">
		                                        <h4 class="task-card-title">My Task</h4>
		                                        <p class="task-card-date">March 26, 2015</p>
		                                    </li>
		                                    <li class="collection-item dismissable">
		                                        <input type="checkbox" id="task1" />
		                                        <label for="task1">Create Mobile App UI. <a href="#" class="secondary-content"><span class="ultra-small">Today</span></a>
		                                        </label>
		                                        <span class="task-cat teal">Mobile App</span>
		                                    </li>
		                                    <li class="collection-item dismissable">
		                                        <input type="checkbox" id="task2" />
		                                        <label for="task2">Check the new API standerds. <a href="#" class="secondary-content"><span class="ultra-small">Monday</span></a>
		                                        </label>
		                                        <span class="task-cat purple">Web API</span>
		                                    </li>
		                                    <li class="collection-item dismissable">
		                                        <input type="checkbox" id="task3" checked="checked" />
		                                        <label for="task3">Check the new Mockup of ABC. <a href="#" class="secondary-content"><span class="ultra-small">Wednesday</span></a>
		                                        </label>
		                                        <span class="task-cat pink">Mockup</span>
		                                    </li>
		                                    <li class="collection-item dismissable">
		                                        <input type="checkbox" id="task4" checked="checked" disabled="disabled" />
		                                        <label for="task4">I did it !</label>
		                                        <span class="task-cat cyan">Mobile App</span>
		                                    </li>
		                                </ul>
		                            </div>
		
		                            <div class="col s12 m6 l4">
		                                <div id="flight-card" class="card">
		                                    <div class="card-header amber darken-2">
		                                        <div class="card-title">
		                                            <h4 class="flight-card-title">Flight</h4>
		                                            <p class="flight-card-date">June 18, Thu 04:50</p>
		                                        </div>
		                                    </div>
		                                    <div class="card-content-bg white-text">
		                                        <div class="card-content">
		                                            <div class="row flight-state-wrapper">
		                                                <div class="col s5 m5 l5 center-align">
		                                                    <div class="flight-state">
		                                                        <h4 class="margin">LDN</h4>
		                                                        <p class="ultra-small">London</p>
		                                                    </div>
		                                                </div>
		                                                <div class="col s2 m2 l2 center-align">
		                                                    <i class="mdi-device-airplanemode-on flight-icon"></i>
		                                                </div>
		                                                <div class="col s5 m5 l5 center-align">
		                                                    <div class="flight-state">
		                                                        <h4 class="margin">SFO</h4>
		                                                        <p class="ultra-small">San Francisco</p>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col s6 m6 l6 center-align">
		                                                    <div class="flight-info">
		                                                        <p class="small"><span class="grey-text text-lighten-4">Depart:</span> 04.50</p>
		                                                        <p class="small"><span class="grey-text text-lighten-4">Flight:</span> IB 5786</p>
		                                                        <p class="small"><span class="grey-text text-lighten-4">Terminal:</span> B</p>
		                                                    </div>
		                                                </div>
		                                                <div class="col s6 m6 l6 center-align flight-state-two">
		                                                    <div class="flight-info">
		                                                        <p class="small"><span class="grey-text text-lighten-4">Arrive:</span> 08.50</p>
		                                                        <p class="small"><span class="grey-text text-lighten-4">Flight:</span> IB 5786</p>
		                                                        <p class="small"><span class="grey-text text-lighten-4">Terminal:</span> C</p>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		
		                            <div class="col s12 m6 l4">
		                                <div id="profile-card" class="card">
		                                    <div class="card-image waves-effect waves-block waves-light">
		                                        <img class="activator" src="images/user-bg.jpg" alt="user background">
		                                    </div>
		                                    <div class="card-content">
		                                        <img src="images/avatar.jpg" alt="" class="circle responsive-img activator card-profile-image">
		                                        <a class="btn-floating activator btn-move-up waves-effect waves-light darken-2 right">
		                                            <i class="mdi-editor-mode-edit"></i>
		                                        </a>
		
		                                        <span class="card-title activator grey-text text-darken-4">Roger Waters</span>
		                                        <p><i class="mdi-action-perm-identity cyan-text text-darken-2"></i> Project Manager</p>
		                                        <p><i class="mdi-action-perm-phone-msg cyan-text text-darken-2"></i> +1 (612) 222 8989</p>
		                                        <p><i class="mdi-communication-email cyan-text text-darken-2"></i> mail@domain.com</p>
		
		                                    </div>
		                                    <div class="card-reveal">
		                                        <span class="card-title grey-text text-darken-4">Roger Waters <i class="mdi-navigation-close right"></i></span>
		                                        <p>Here is some more information about this card.</p>
		                                        <p><i class="mdi-action-perm-identity cyan-text text-darken-2"></i> Project Manager</p>
		                                        <p><i class="mdi-action-perm-phone-msg cyan-text text-darken-2"></i> +1 (612) 222 8989</p>
		                                        <p><i class="mdi-communication-email cyan-text text-darken-2"></i> mail@domain.com</p>
		                                        <p><i class="mdi-social-cake cyan-text text-darken-2"></i> 18th June 1990</p>
		                                        <p><i class="mdi-device-airplanemode-on cyan-text text-darken-2"></i> BAR - AUS</p>
		                                    </div>
		                                </div>
		                            </div>
		
		                        </div>
		                    </div>
		                    <!--card widgets end-->
		
		                    <!-- //////////////////////////////////////////////////////////////////////////// -->
		
		                    <!--work collections start-->
		                    <div id="work-collections">
		                        <div class="row">
		                            <div class="col s12 m12 l6">
		                                <ul id="projects-collection" class="collection">
		                                    <li class="collection-item avatar">
		                                        <i class="mdi-file-folder circle light-blue darken-2"></i>
		                                        <span class="collection-header">Projects</span>
		                                        <p>Your Favorites</p>
		                                        <a href="#" class="secondary-content"><i class="mdi-action-grade"></i></a>
		                                    </li>
		                                    <li class="collection-item">
		                                        <div class="row">
		                                            <div class="col s6">
		                                                <p class="collections-title">Web App</p>
		                                                <p class="collections-content">AEC Company</p>
		                                            </div>
		                                            <div class="col s3">
		                                                <span class="task-cat cyan">Development</span>
		                                            </div>
		                                            <div class="col s3">
		                                                <div id="project-line-1"></div>
		                                            </div>
		                                        </div>
		                                    </li>
		                                    <li class="collection-item">
		                                        <div class="row">
		                                            <div class="col s6">
		                                                <p class="collections-title">Mobile App for Social</p>
		                                                <p class="collections-content">iSocial App</p>
		                                            </div>
		                                            <div class="col s3">
		                                                <span class="task-cat grey darken-3">UI/UX</span>
		                                            </div>
		                                            <div class="col s3">
		                                                <div id="project-line-2"></div>
		                                            </div>
		                                        </div>
		                                    </li>
		                                    <li class="collection-item">
		                                        <div class="row">
		                                            <div class="col s6">
		                                                <p class="collections-title">Website</p>
		                                                <p class="collections-content">MediTab</p>
		                                            </div>
		                                            <div class="col s3">
		                                                <span class="task-cat teal">Marketing</span>
		                                            </div>
		                                            <div class="col s3">
		                                                <div id="project-line-3"></div>
		                                            </div>
		                                        </div>
		                                    </li>
		                                    <li class="collection-item">
		                                        <div class="row">
		                                            <div class="col s6">
		                                                <p class="collections-title">AdWord campaign</p>
		                                                <p class="collections-content">True Line</p>
		                                            </div>
		                                            <div class="col s3">
		                                                <span class="task-cat green">SEO</span>
		                                            </div>
		                                            <div class="col s3">
		                                                <div id="project-line-4"></div>
		                                            </div>
		                                        </div>
		                                    </li>
		                                </ul>
		                            </div>
		                            <div class="col s12 m12 l6">
		                                <ul id="issues-collection" class="collection">
		                                    <li class="collection-item avatar">
		                                        <i class="mdi-action-bug-report circle red darken-2"></i>
		                                        <span class="collection-header">Issues</span>
		                                        <p>Assigned to you</p>
		                                        <a href="#" class="secondary-content"><i class="mdi-action-grade"></i></a>
		                                    </li>
		                                    <li class="collection-item">
		                                        <div class="row">
		                                            <div class="col s7">
		                                                <p class="collections-title"><strong>#102</strong> Home Page</p>
		                                                <p class="collections-content">Web Project</p>
		                                            </div>
		                                            <div class="col s2">
		                                                <span class="task-cat pink accent-2">P1</span>
		                                            </div>
		                                            <div class="col s3">
		                                                <div class="progress">
		                                                     <div class="determinate" style="width: 70%"></div>   
		                                                </div>                                                
		                                            </div>
		                                        </div>
		                                    </li>
		                                    <li class="collection-item">
		                                        <div class="row">
		                                            <div class="col s7">
		                                                <p class="collections-title"><strong>#108</strong> API Fix</p>
		                                                <p class="collections-content">API Project </p>
		                                            </div>
		                                            <div class="col s2">
		                                                <span class="task-cat yellow darken-4">P2</span>
		                                            </div>
		                                            <div class="col s3">
		                                                <div class="progress">
		                                                    <div class="determinate" style="width: 40%"></div>   
		                                                </div>                                                
		                                            </div>
		                                        </div>
		                                    </li>
		                                    <li class="collection-item">
		                                        <div class="row">
		                                            <div class="col s7">
		                                                <p class="collections-title"><strong>#205</strong> Profile page css</p>
		                                                <p class="collections-content">New Project </p>
		                                            </div>
		                                            <div class="col s2">                                                
		                                                <span class="task-cat light-green darken-3">P3</span>
		                                            </div>
		                                            <div class="col s3">
		                                                <div class="progress">
		                                                    <div class="determinate" style="width: 95%"></div>   
		                                                </div>                                                
		                                            </div>
		                                        </div>
		                                    </li>
		                                    <li class="collection-item">
		                                        <div class="row">
		                                            <div class="col s7">
		                                                <p class="collections-title"><strong>#188</strong> SAP Changes</p>
		                                                <p class="collections-content">SAP Project</p>
		                                            </div>
		                                            <div class="col s2">
		                                                <span class="task-cat pink accent-2">P1</span>
		                                            </div>
		                                            <div class="col s3">
		                                                <div class="progress">
		                                                     <div class="determinate" style="width: 10%"></div>   
		                                                </div>                                                
		                                            </div>
		                                        </div>
		                                    </li>
		                                </ul>
		                            </div>
		                        </div>
		                    </div>
		                    <!--work collections end-->
		
		                </div>
		                <!--end container-->
		            </section>
		            <!-- END CONTENT -->
            
            
				    <!-- START FOOTER -->
				    <footer class="page-footer z-depth-3">
				        <div class="container">
				            <div class="row">
				                <div class="col l6 s12">
				                    <h5 class="white-text">World Market</h5>
				                    <p class="grey-text text-lighten-4">World map, world regions, countries and cities.</p>
				                    <div id="world-map-markers"></div>
				                </div>
				                <div class="col l4 offset-l2 s12">
				                    <h5 class="white-text">Sales by Country</h5>
				                    <p class="grey-text text-lighten-4">A sample polar chart to show sales by country.</p>
				                    <div id="polar-chart-holder">
				                        <canvas id="polar-chart-country" width="200"></canvas>
				                    </div>
				                </div>
				            </div>
				        </div>
				        <div class="footer-copyright">
				            <div class="container">
				                Copyright MonsterFucker Team © 2017   All rights reserved.
				                <span class="right"> Design and Developed by  MonsterFucker's</span>
				            </div>
				        </div>
				    </footer>
				    <!-- END FOOTER -->
        		</div>
        		
        	</div>

        </div>
        <!-- END WRAPPER -->

    </div>
    <!-- END MAIN -->



    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- ================================================
    Scripts
    ================================================ -->
    
    <!-- jQuery Library -->
    <script src="jquery/jquery-1.10.2.js"></script> 
    <!--materialize js-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <!--scrollbar-->
    <script type="text/javascript" src="js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
       

    <!-- chartist -->
    <script type="text/javascript" src="js/plugins/chartist-js/chartist.min.js"></script>   

    <!-- chartjs -->
    <script type="text/javascript" src="js/plugins/chartjs/chart.min.js"></script>
    <script type="text/javascript" src="js/plugins/chartjs/chart-script.js"></script>

    <!-- sparkline -->
    <script type="text/javascript" src="js/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="js/plugins/sparkline/sparkline-script.js"></script>
    
    <!--jvectormap-->
    <script type="text/javascript" src="js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script type="text/javascript" src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script type="text/javascript" src="js/plugins/jvectormap/vectormap-script.js"></script>
    
    
    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="js/plugins.js"></script>
    <!-- Toast Notification -->
    <script type="text/javascript">
    // Toast Notification
    $(window).load(function() {
        setTimeout(function() {
            Materialize.toast('<span>Hi!  Welcome to Dashboard  <%=username %></span>', 2500);
        }, 3000);
        <%if(un_read_num>0){ %>
        setTimeout(function() {
            Materialize.toast('<span>You have <%=un_read_num%> new message!</span><a class="btn-flat yellow-text" href="message.jsp">Read<a>', 6000);
        }, 4500);
        <%}%>
        setTimeout(function() {
            Materialize.toast('<span>You have new order.</span><a class="btn-flat yellow-text" href="#">Read<a>', 3000);
        }, 18000);
    });
    
    </script>
</body>

</html>


<!--///////////////////////////////////////////////////////-->
	