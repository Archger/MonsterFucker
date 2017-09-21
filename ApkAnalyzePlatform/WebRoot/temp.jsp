<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "com.analysis.cfg.HibernateSessionFactory" %>
<%@ page import = "org.hibernate.Query" %>
<%@ page import = "org.hibernate.Session"%>
<%@ page import = "org.hibernate.Transaction" %>
<%@ page import = "com.analysis.hibernate.*" %>
<%@ page import = "org.hibernate.Criteria" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
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
				background-image: url(images/back_demo.jpg);
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
Object upload=request.getSession().getAttribute("upload");
Object download=request.getSession().getAttribute("download");
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
      <li><a class="btn-floating red" href="statistic.jsp"><i class="material-icons">insert_chart</i></a></li>
      <li><a class="btn-floating yellow darken-1" href="message.jsp"><i class="material-icons">question_answer</i></a></li>
      <li><a class="btn-floating green" href="upload.jsp"><i class="material-icons">publish</i></a></li>
      <li><a class="btn-floating blue" href="dashboard.jsp"><i class="material-icons">perm_identity</i></a></li>
    </ul>
  </div>

		<header>
			<nav class="top-nav z-depth-2 hoverable">
				<div class="container">
					<div class="nav-wrapper">
						<span class="flow-text left-align">Dashboard</span>
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
				<li class="bold active red lighten-4">
					<a href="dashboard.jsp" class="waves-effect waves-cyan"><i class="material-icons">toc</i> 控制台</a>
				</li>
				<%if((Boolean)upload){ %>
				<li class="bold">
					<a href="upload.jsp" class="waves-effect waves-cyan"><i class="material-icons">present_to_all</i> 文件上传</a>
				</li><%} %>
				<li class="bold">
					<a href="message.jsp" class="waves-effect waves-cyan"><i class="material-icons">message</i>消息通知<%if(un_read_num>0){%><span class="new badge blue lighten-1"><%=un_read_num %></span><%}%></a>
				</li>
				<li class="bold">
					<a href="statistic.jsp" class="waves-effect waves-cyan"><i class="material-icons">assessment</i> 统计管理</a>
				</li>
				<%if((Boolean)is_admin){ %>
				<li class="bold">
					<a href="usermanager.jsp" class="waves-effect waves-cyan"><i class="material-icons">perm_identity</i> 用户管理</a>
				</li><%} %>
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
						<div id="introduction" class="section scrollspy">
							<!--start-->
							<form action  = "/ApkAnalyzePlatform/searchpattern" method = "post">
        名称 <input name = "apkName" type = "text" ><br>
        类型<select name = "apkType" class="browser-default">
											<option value="">选择类型</option>
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
										</select><br>
        开发者<input name = "developer_name" type = "text" ><br>  
        版本     <input name = "versionName" type = "text" ><br>
        <input name = "submit" type = "submit" class="btn">
        </form>
							<!--end-->
						</div>
						<div id="structure" class="section scrollspy">
							<table>
        <tr>
            <td> 产品名称</td>
            <td> 开发者    </td>
            <td> 产品类型 </td>
            <td> 版本          </td>
            <td> 是否有权限获取手机状态</td>
        </tr>
    <c:forEach var = "i" items = "${list2}" varStatus = "f">
       <tr>
           <td>${i.apkName}</td>
           <td>${i.developerId}</td>
           <td>${i.apkType}</td>
           <td>${i.versionName }</td>
           <td>${i.readPhoneState}</td>
       </tr>
    </c:forEach>
   </table>
    <div>
                             第${page.pageno }/${page.totalpage}页 &nbsp;&nbsp;
         <a href = "fenye?pageNo = 1">首页</a>
         <c:choose>
             <c:when test = "${page.pageno gt 1 }">
                 <a href = "Showpage?pageNo=${page.pageno-1}">上一页</a>
             </c:when>
             <c:otherwise>
                 <a href = "javascript:alert('已经是第一页')">上一页</a>
             </c:otherwise>
         </c:choose>
         <c:choose>
             <c:when test = "${page.pageno lt page.totalpage }">
                 <a href  ="Showpage?pageNo=${page.pageno+1}">下一页</a>
             </c:when>
             <c:otherwise>
                 <a href = "javascript:alert('已经是最后一页')">下一页</a>
             </c:otherwise>
         </c:choose>     
         <a href = "Showpage?pageNo=${page.totalpage}">末页</a>
         &nbsp;&nbsp;
                                 共${page.totalcount } 条    
    </div>

						</div>
						<div id="initialization" class="section scrollspy">
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
								<a href="#introduction">介绍</a>
							</li>
							<li>
								<a href="#structure">结构</a>
							</li>
							<li>
								<a href="#initialization">初始化</a>
							</li>
						</ul>
					</div>
				</div>
				<!--right end-->

				<div class="file-field input-field">
					<div class="btn">
						<span>文件</span>
						<input type="file" />
					</div>
					<div class="file-path-wrapper">
						<input class="file-path validate" type="text" />
					</div>
				</div>
				<nav>
					<div class="nav-wrapper">
						<form>
							<div class="input-field hoverable">
								<input id="search" type="search" required="" />
								<label class="label-icon" for="search"><i class="material-icons">search</i></label>
								<i class="material-icons">close</i>
							</div>
						</form>
					</div>
				</nav>
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

    
</html>
