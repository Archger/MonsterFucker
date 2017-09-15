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
		<title>Analysis</title>
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
		<!--java end-->

		<!--Import jQuery before materialize.js-->
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>

		<header>
			<nav class="top-nav">
				<div class="container">
					<div class="nav-wrapper">
						<span class="flow-text left-align">Analysis</span>
					</div>
				</div>
			</nav>

			<ul id="slide-out" class="side-nav fixed">
				<li class="logo"> <img src="images/materialize-logo.png" /> </li>
				<li>
					<div class="userView">
						<div class="background">
							<img src="images/user-bg.jpg">
						</div>
						<img class="circle" src="images/sample4.jpg">
						<span class="white-text name"><%=username %></span>
						<span class="white-text"><%
                                if((Boolean)is_admin)
                                {
                                	%>管理员<%
                                }
                                else
                                {
                                	%>用户<%
                                }
                                 %></span>
					</div>
				</li>
				<li class="bold">
					<a href="dashboard.jsp" class="waves-effect waves-cyan"><i class="material-icons">toc</i> 控制台</a>
				</li>
				<li class="bold active teal lighten-4">
					<a href="upload.jsp" class="waves-effect waves-cyan"><i class="material-icons">present_to_all</i> 文件上传</a>
				</li>
				<li class="bold">
					<a href="message.jsp" class="waves-effect waves-cyan"><i class="material-icons">message</i>消息通知</a>
				</li>
				<li class="bold">
					<a href="statistic.jsp" class="waves-effect waves-cyan"><i class="material-icons">assessment</i> 统计管理</a>
				</li>
				<li class="bold">
					<a href="usermanager.jsp" class="waves-effect waves-cyan"><i class="material-icons">perm_identity</i> 用户管理</a>
				</li>
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
						<div id="analysis" class="section scrollspy">
							<!--start-->
								<p class="flow-text center">${message}</p> <br>
									   <%
									   Object obj=request.getAttribute("apk");
										   Apk apk=(Apk)obj; 
										   if(apk!=null)
										   {
										   
									   %>
									   <div class="row">
										   <div class="col s12">
										   	<div class="col s10 m4 l2">
										   		<div class="card hoverable z-depth-1">
								            <div class="card-image">
								              <img src="${iconPath}">
								            </div>
								            <div class="card-content">
								            	<h5 class="left pink-text"><%=apk.getApkName() %></h5><br /><br /><br />
								              <p class="left">应用类型：<br /><%=apk.getApkType() %></p><br /><br /><br />
											  <p class="left">版本号：<br /><%=apk.getVersionName() %></p><br /><br />
								            </div>
								          </div>
										   	</div>
										   	<div class="col s12 m6 l10">
										   		<div class="card">
										   		<table class="striped highlight centered">
									        <thead>
									          <tr>
									              <th data-field="id">权限名称</th>
									              <th data-field="name">详情</th>
									          </tr>
									        </thead>
									
									        <tbody>
									          
									          <tr>
									            <td>获取大致位置信息</td>
									            <td><%if(apk.getAccessCoarseLocation()){out.println("√");}%></td>
									          </tr>
									         
									          <tr>
									            <td>获取精确位置信息</td>
									            <td><%if(apk.getAccessFineLocation()){out.println("√");} %></td>
									          </tr>
									                 
									          <tr>
									            <td>网络访问</td>
									            <td><%if(apk.getInternet()){out.println("√");} %></td>
									          </tr>
									          
									          <tr>
									            <td>拍摄照片或视频</td>
									            <td><%if(apk.getCamera()){out.println("√");} %></td>
									          </tr>  
									             
									          <tr>
									            <td>录音</td>
									            <td><%if(apk.getRecordAudio()){out.println("√");} %></td>
									          </tr>
									          
									          <tr>
									            <td>访问联系人</td>
									            <td><%if(apk.getReadContacts()){out.println("√");} %></td>
									          </tr>  
									             
									          <tr>
									            <td>编辑联系人</td>
									            <td><%if(apk.getWriteContacts()){out.println("√");} %></td>
									          </tr>
									          
									          <tr>
									            <td>蓝牙</td>
									            <td><%if(apk.getBluetooth()){out.println("√");} %></td>
									          </tr>
									          
									          <tr>
									            <td>NFC</td>
									            <td><%if(apk.getNfc()){out.println("√");} %></td>
									          </tr>
									          
									          <tr>
									            <td>拨打电话</td>
									            <td><%if(apk.getCallaPhone()){out.println("√");} %></td>
									          </tr>
									            
									          <tr>
									            <td>访问短信</td>
									            <td><%if(apk.getReadSms()){out.println("√");} %></td>
									          </tr>
									          
									          <tr>
									            <td>编辑短信</td>
									            <td><%if(apk.getWriteContacts()){out.println("√");} %></td>
									          </tr>
									          <tr>
									            <td>更改音频设置</td>
									            <td><%if(apk.getModifyAudioSettings()){out.println("√");} %></td>
									          </tr>
									                    
									          <tr>
									            <td>人体传感器</td>
									            <td><%if(apk.getBodySensors()){out.println("√");} %></td>
									          </tr>
									                    
									          <tr>
									            <td>读取外部存储设备中的内容</td>
									            <td><%if(apk.getReadExternalStorage()){out.println("√");} %></td>
									          </tr>
									                    
									          <tr>
									            <td>修改或删除外部存储设备中的内容</td>
									            <td><%if(apk.getWriteExternalStorage()){out.println("√");} %></td>
									          </tr>
									                    
									          <tr>
									            <td>读取手机状态</td>
									            <td><%if(apk.getReadPhoneState()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>修改手机状态</td>
									            <td><%if(apk.getModifyPhoneState()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>连接WLAN网络和断开连接</td>
									            <td><%if(apk.getChangeWifiState()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>查看WLAN连接</td>
									            <td><%if(apk.getAccessWifiState()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>控制闪光灯</td>
									            <td><%if(apk.getFlashlight()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>防止手机休眠</td>
									            <td><%if(apk.getWakeLock()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>控制振动</td>
									            <td><%if(apk.getViberate()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>在其他应用之上显示内容</td>
									            <td><%if(apk.getSystemAlertWindow()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>开机启动</td>
									            <td><%if(apk.getReceiveBootCompleted()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>查看网络状态</td>
									            <td><%if(apk.getAccessNetworkState()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>更改网络状态</td>
									            <td><%if(apk.getChangeNetworkState()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>读取通话记录</td>
									            <td><%if(apk.getReadCallLog()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>写入通话记录</td>
									            <td><%if(apk.getWriteCallLog()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>读取电池使用统计信息</td>
									            <td><%if(apk.getBattertyStats()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>修改系统设置</td>
									            <td><%if(apk.getWriteSettings()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>展开/收拢状态栏</td>
									            <td><%if(apk.getExpandStatusBar()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>设置壁纸</td>
									            <td><%if(apk.getSetWallpaper()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>设置首选应用</td>
									            <td><%if(apk.getSetPreferredApplications()){out.println("√");} %></td>
									          </tr>
									                              
									          <tr>
									            <td>修改安全系统设置</td>
									            <td><%if(apk.getWriteSecureSettings()){out.println("√");} %></td>
									          </tr>
									          
									        </tbody>
									      </table>
										   		</div>
										   	</div>
											    
											  </div>
									  </div>
									   <br>
									
									 <%} %>
							<!--end-->
						</div>
					</div>
					<div class="col hide-on-small-only m3 l2">
						<ul class="section table-of-contents side-nav-bar">
							<li>
								<a href="#analysis">分析结果</a>
							</li>
						</ul>
					</div>
				</div>
				<!--right end-->

			</div>
		</main>

		<!--foot start-->
		<footer class="page-footer">
			<div class="container">
				<div class="row">
					<div class="col l6 s12">
						<h5 class="white-text">联系我们</h5>
						<p class="grey-text text-lighten-4">QQ:xxxxxxxxxx</p>
						<p class="grey-text text-lighten-4">TEL:xxxxxxxxx</p>
					</div>
					<div class="col l4 offset-l2 s12">
						<h5 class="white-text">关于网站</h5>
						<ul>
							<li>
								<a class="grey-text text-lighten-3" href="#!">制作</a>
							</li>
							<li>
								<a class="grey-text text-lighten-3" href="#!">合作</a>
							</li>
							<li>
								<a class="grey-text text-lighten-3" href="#!">发展</a>
							</li>
							<li>
								<a class="grey-text text-lighten-3" href="#!">鸣谢</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="footer-copyright">
				<div class="container">
					Copyright MonsterFucker Team © 2017 All rights reserved.
					<span class="right"> Design and Developed by  MonsterFucker's</span>
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