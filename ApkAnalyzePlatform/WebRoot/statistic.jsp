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
		<title>统计信息</title>
		<meta charset="utf-8" />
    	<link href="css/materialdesignicons.min.css" media="all" rel="stylesheet" type="text/css" />
		<!--Import Google Icon Font-->
		<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
		<!--Import materialize.css-->
		<link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
		<!--Let browser know website is optimized for mobile-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<script type="text/javascript" src="FusionCharts/js/fusioncharts.js"></script>
		<script type="text/javascript" src="FusionCharts/js/themes/fusioncharts.theme.fint.js"></script>

		
		<link rel="stylesheet" href="css/style.css" type="text/css" > 

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
						<span class="flow-text left-align">APK统计</span>
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
				<li class="bold active red lighten-4">
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
		<br />
		<br />
		
			<div class="container">

				<form method="post" action="/ApkAnalyzePlatform/ApkStatistics">
					<!--right start-->
					<div class="row col s12">
						<div class="card col s12 hoverable z-depth-1">
							<div id="apktime" class="section scrollspy">
								<!--start-->
								<p class="flow-text">上传时间统计</p><br /> 统计区间：
								<input type="month" name="startMonth">~<input type="month" name="endMonth">
								<!--end-->
							</div>
						</div>
						<div class="card col s12 hoverable z-depth-1">
							<div id="apksize" class="section scrollspy col s12">
								<!--start-->
								<p class="flow-text col s12">文件大小统计</p><br />
								<span class="col s12">统计区间</span>
								<input class="col s5" name="minSize" min="0" max="500" step="10" type="number"><span class="col s1">MB~</span><input class="col s5" name="maxSize" min="0" max="500" step="10" type="number"><span class="col s1">MB</span>
								<!--end-->

							</div>
						</div>
						<div class="card col s12 hoverable z-depth-1">
							<div id="apktype" class="section scrollspy">
								<!--start-->
								<p class="flow-text">选择需要统计的Apk类型</p><br />
								<input name="ApkTypes" type="checkbox" value="系统工具" id="apktype1" />
								<label for="apktype1">系统工具</label>

								<input name="ApkTypes" type="checkbox" value="桌面插件" id="apktype_1" />
								<label for="apktype_1">桌面插件</label>

								<input name="ApkTypes" type="checkbox" value="资讯阅读" id="apktype_2" />
								<label for="apktype_2">资讯阅读</label>

								<input name="ApkTypes" type="checkbox" value="社交聊天" id="apktype_3" />
								<label for="apktype_3">社交聊天</label>

								<input name="ApkTypes" type="checkbox" value="影音娱乐" id="apktype_4" />
								<label for="apktype_4">影音娱乐</label>

								<input name="ApkTypes" type="checkbox" value="生活服务" id="apktype_5" />
								<label for="apktype_5">生活服务</label>

								<input name="ApkTypes" type="checkbox" value="实用工具" id="apktype_6" />
								<label for="apktype_6">实用工具</label>

								<input name="ApkTypes" type="checkbox" value="文档商务" id="apktype_7" />
								<label for="apktype_7">文档商务</label>

								<input name="ApkTypes" type="checkbox" value="金融财经" id="apktype_8" />
								<label for="apktype_8">金融财经</label>

								<input name="ApkTypes" type="checkbox" value="运动健康" id="apktype_91" />
								<label for="apktype_91">运动健康</label>

								<input name="ApkTypes" type="checkbox" value="学习教育" id="apktype_9" />
								<label for="apktype_9">学习教育</label>

								<input name="ApkTypes" type="checkbox" value="出行交通" id="apktype_10" />
								<label for="apktype_10">出行交通</label>

								<input name="ApkTypes" type="checkbox" value="其它" id="apktype_11" />
								<label for="apktype_11">  其它</label>
								<!--end-->

							</div>
						</div>
						<div class="card col s12 hoverable z-depth-1">
							<div id="apkmess" class="section scrollspy">
								<!--start-->
								<p class="flow-text">选择需要统计的权限信息</p><br />

								<input name="Permissions" id="apkms1" type="checkbox" value="access_coarse_location" />
								<label for="apkms1">获取大致位置信息</label>

								<input name="Permissions" id="apkms2" type="checkbox" value="access_fine_location" />
								<label for="apkms2">获取精确位置信息</label>

								<input name="Permissions" id="apkms3" type="checkbox" value="internet" />
								<label for="apkms3">网络访问</label>

								<input name="Permissions" id="apkms4" type="checkbox" value="camera" />
								<label for="apkms4">拍摄照片或视频</label>

								<input name="Permissions" id="apkms5" type="checkbox" value="record_audio" />
								<label for="apkms5">录音</label>

								<input name="Permissions" id="apkms6" type="checkbox" value="read_contacts" />
								<label for="apkms6">访问联系人</label>

								<input name="Permissions" id="apkms7" type="checkbox" value="write_contacts" />
								<label for="apkms7">编辑联系人</label>

								<input name="Permissions" id="apkms8" type="checkbox" value="bluetooth" />
								<label for="apkms8">蓝牙</label>

								<input name="Permissions" id="apkms9" type="checkbox" value="nfc" />
								<label for="apkms9">NFC</label>

								<input name="Permissions" id="apkms10" type="checkbox" value="calla_phone" />
								<label for="apkms10">拨打电话</label>

								<input name="Permissions" id="apkms11" type="checkbox" value="read_sms" />
								<label for="apkms11">访问短信</label>

								<input name="Permissions" id="apkms12" type="checkbox" value="write_sms" />
								<label for="apkms12">编辑短信</label>

								<input name="Permissions" id="apkms13" type="checkbox" value="modify_audio_settings" />
								<label for="apkms13">更改音频设置</label>

								<input name="Permissions" id="apkms14" type="checkbox" value="body_sensors" />
								<label for="apkms14">人体传感器</label>

								<input name="Permissions" id="apkms15" type="checkbox" value="read_external_storage" />
								<label for="apkms15">读取外部存储设备中的内容</label>

								<input name="Permissions" id="apkms16" type="checkbox" value="write_external_storage" />
								<label for="apkms16">更改或删除外部存储设备中的内容</label>

								<input name="Permissions" id="apkms17" type="checkbox" value="read_phone_state" />
								<label for="apkms17">读取手机状态</label>

								<input name="Permissions" id="apkms18" type="checkbox" value="modify_phone_state" />
								<label for="apkms18">修改手机状态</label>

								<input name="Permissions" id="apkms19" type="checkbox" value="change_wifi_state" />
								<label for="apkms19">连接WLAN网络和断开连接</label>

								<input name="Permissions" id="apkms20" type="checkbox" value="access_wifi_state" />
								<label for="apkms20">查看WLAN连接</label>

								<input name="Permissions" id="apkms21" type="checkbox" value="flashlight" />
								<label for="apkms21">控制闪光灯</label>

								<input name="Permissions" id="apkms22" type="checkbox" value="viberate" />
								<label for="apkms22">控制振动</label>

								<input name="Permissions" id="apkms23" type="checkbox" value="system_alert_window" />
								<label for="apkms23">在其他应用之上显示内容</label>

								<input name="Permissions" id="apkms24" type="checkbox" value="receive_boot_completed" />
								<label for="apkms24">开机启动</label>

								<input name="Permissions" id="apkms25" type="checkbox" value="access_network_state" />
								<label for="apkms25">查看网络状态</label>

								<input name="Permissions" id="apkms26" type="checkbox" value="change_network_state" />
								<label for="apkms26">更改网络状态</label>

								<input name="Permissions" id="apkms27" type="checkbox" value="read_call_log" />
								<label for="apkms27">读取通话记录</label>

								<input name="Permissions" id="apkms28" type="checkbox" value="write_call_log" />
								<label for="apkms28">写入通话记录</label>

								<input name="Permissions" id="apkms29" type="checkbox" value="batterty_stats" />
								<label for="apkms29">读取电池使用统计信息</label>

								<input name="Permissions" id="apkms30" type="checkbox" value="write_settings" />
								<label for="apkms30">修改系统设置</label>

								<input name="Permissions" id="apkms31" type="checkbox" value="expand_status_bar" />
								<label for="apkms31">展开/收拢状态栏</label>

								<input name="Permissions" id="apkms311" type="checkbox" value="set_wallpaper" />
								<label for="apkms311">设置壁纸</label>

								<input name="Permissions" id="apkms33" type="checkbox" value="set_preferred_applications" />
								<label for="apkms33">设置首选应用</label>

								<input name="Permissions" id="apkms34" type="checkbox" value="write_secure_settings" />
								<label for="apkms34">修改安全系统设置</label>
								<br />
								<br />
								<br />
								<br />


							</div>
						</div>

			<div class="row col s12">
				<div class="col s6"><input type="reset" value="清空" class="btn left"></div>
				<div class="col s6"><input type="submit" value="确定" class="btn right"> </div>
			</div>
					</div>

				</form>
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