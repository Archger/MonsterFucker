<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "com.analysis.cfg.HibernateSessionFactory" %>
<%@ page import = "org.hibernate.Query" %>
<%@ page import = "org.hibernate.Session"%>
<%@ page import = "org.hibernate.Transaction" %>
<%@ page import = "com.analysis.hibernate.*" %>
<%@ page import = "org.hibernate.Criteria" %>
<%@ page import = "org.hibernate.criterion.Restrictions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<base href="<%=basePath%>">

		<title>查找</title>
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
List<Message> list3=q3.list();
for(int i=0;i<list3.size();i++)
{
	if(!list3.get(i).getIsRead())
		un_read_num++;
}
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
						<span class="flow-text left-align">查找</span>
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
				<li class="bold">
					<a href="usermanager.jsp" class="waves-effect waves-cyan"><i class="large mdi mdi-24px mdi-dark mdi-account-edit"></i> 用户管理</a>
				</li><%} %>
				<li class="bold active red lighten-4">
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
				<br />
				<br />
				<!--right start-->
				<div class="row">
					<div class="card col s12 m9 l10">
						<div id="introduction" class="section scrollspy col s12">
							<br />
							<br />
							<!--start-->
							<form action="/ApkAnalyzePlatform/searchpattern" method="post">
								<div class="row">
									<div class="col s12 m6 l3 input-field">
										<input name="apkName" type="text" class="validate" id="a1">
										<label for="a1">APK名称</label>
									</div>
									<div class="col s12 m6 l3 input-field">
										<input name="developer_name" type="text" class="validate" id="a2">
										<label for="a2">开发者</label>
									</div>
									<div class="col s12 m6 l3 input-field">
										<input name="versionName" type="text" class="validate" id="a3">
										<label for="a3">版本</label>
									</div>
									<div class="col s12 m6 l3">

										<select name="apkType" class="browser-default">
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
										</select>
									</div>
									
								</div>
								<div class="row">
									<input name="submit" type="submit" value="查询" class="btn right" onclick="Materialize.toast('正在查询', 4000)">
								</div>
							</form>
							<br />
							<br />
							<!--end-->
						</div>
						<br />
						<div id="structure" class="section scrollspy">
							<br />
							<div class="divider"></div>
							<br />
							<div id="div1">
								<div class="row">
									<br />
									<br />
									<div>
										<br />
										<br />
										<form action="/ApkAnalyzePlatform/Showpage" method="post">
											<div class="col s12 m4">
												<select name="order" class="browser-default">
													<option value=""> 选择类型 </option>
													<option value="apkName"> 产品名称</option>
													<option value="developer_Id">开发者Id</option>
													<option value="apkType">产品类型</option>
													<option value="versionName">产品版本</option>
												</select>
											</div>
											<div class="col s12 m4">
												<select name="type" class="browser-default">
													<option value=""> 选择升序或降序</option>
													<option value="1"> 升序</option>
													<option value="2"> 降序</option>
												</select>
											</div>
											<br />
											<div class="divider"></div>
											<br />
											<div class="col s12 m4">
												<input name="submit" type="submit" class="btn right" value="排序" onclick="Materialize.toast('查询结果已排序', 4000)">
											</div>
										</form>
										<br />
										<br />
										<br />
									</div>
								</div>

								<table class="striped center">
									<tr>
										<th></th>
										<td> 产品名称</td>
										<td> 开发者 </td>
										<td> 产品类型 </td>
										<td> 版本 </td>
										<td> 下载</td>
										<td> 查看详细信息</td>
									</tr>
									<%
               List<Apk> res = (List<Apk>) request.getAttribute("res");
               List<Apk> list2 = (List<Apk>) request.getAttribute("list2");
               int len;
			   if(res != null) {
			        session.setAttribute("res", res);
			   }
			   if(list2 != null){
			       len = list2.size();
			   }
			   else len = 0;
               Session session2 = HibernateSessionFactory.getSession();
               Transaction tx = session2.beginTransaction();
               for(int i = 0;i < len;i ++){
             %>
									<tr>
									<%
               String icon = "";
               if(list2.get(i).getIconDirectory() != null) icon= list2.get(i).getIconDirectory();  
             %>
			<th><img src="<%=icon%>" class="responsive-img center"></th>
										<%
               String temp = "";
               if(list2.get(i).getApkName() != null) temp = list2.get(i).getApkName();  
             %>
										<td>
											<%=temp %>
										</td>
										<% 
               if(list2.get(i).getDeveloperId() != null)
               {
               int tmp = list2.get(i).getDeveloperId();
               Criteria cri = session2.createCriteria(User.class);
               cri.add(Restrictions.eq("userId",tmp));
               List<User> list = cri.list();
               temp = "";
               if(list.size()> 0) temp = list.get(0).getUsername();
               }
               else temp = "";
            %>
										<td>
											<%=temp %>
										</td>
										<%
               temp = "";
               if(list2.get(i).getApkType() != null) temp = list2.get(i).getApkType();  
             %>
										<td>
											<%=temp%>
										</td>
										<%
               temp = "";
               if(list2.get(i).getVersionName() != null) temp = list2.get(i).getVersionName();  
             %>
										<td>
											<%=temp %>
										</td>
										<%
               String apk_path = new String();
               if(list2.get(i).getFileDirectoryName() != null) apk_path = list2.get(i).getFileDirectoryName();  
             %>
										<td>
										<%if(!apk_path.isEmpty()&&(Boolean)download){%><a href="<%=apk_path%>">下载</a><%}else{%>无权限<%} %>
										</td>
										<td>
											<a href="/ApkAnalyzePlatform/Apkmessage?apkid=<%=list2.get(i).getApkId()%>" class="btn">详情</a>
										</td>
									</tr>
									<%} %>

								</table>
								<div>
									第${page.pageno }/${page.totalpage}页 &nbsp;&nbsp;
									<a href="Showpage?pageNo = 1">首页</a>
									<c:choose>
										<c:when test="${page.pageno gt 1 }">
											<a href="Showpage?pageNo=${page.pageno-1}">上一页</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:alert('已经是第一页')">上一页</a>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${page.pageno lt page.totalpage }">
											<a href="Showpage?pageNo=${page.pageno+1}">下一页</a>
										</c:when>
										<c:otherwise>
											<a href="javascript:alert('已经是最后一页')">下一页</a>
										</c:otherwise>
									</c:choose>
									<a href="Showpage?pageNo=${page.totalpage}">末页</a>
									&nbsp;&nbsp; 共${page.totalcount } 条
								</div>

							</div>
						</div>
					</div>
					<div class="col hide-on-small-only m3 l2">
						<ul class="section table-of-contents side-nav-bar">
							<li>
								<a href="#introduction">查询</a>
							</li>
							<li>
								<a href="#structure">结果</a>
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

	<script type="text/javascript">
		$(document).ready(function() {
			$('.scrollspy').scrollSpy();
		});
	</script>

</html>