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
		<title>Statistic</title>
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
			#type{
				opacity: 0.7;
			}
			#permission{
				opacity: 0.7;
			}
			#size{
				opacity: 0.7;
			}
			#date{
				opacity: 0.7;
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
				background-image: url(images/loginback3.jpg);
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
				<li class="bold">
					<a href="dashboard.jsp" class="waves-effect waves-cyan"><i class="material-icons">toc</i> 控制台</a>
				</li>
				<li class="bold">
					<a href="upload.jsp" class="waves-effect waves-cyan"><i class="material-icons">present_to_all</i> 文件上传</a>
				</li>
				<li class="bold">
					<a href="message.jsp" class="waves-effect waves-cyan"><i class="material-icons">message</i>消息通知<%if(un_read_num>0){%><span class="new badge blue lighten-1"><%=un_read_num %></span><%}%></a>
				</li>
				<li class="bold active red lighten-4">
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
						<div id="introduction" class="section scrollspy">
							<!--start-->
							
							<!-- 类型统计 -->
      <%if(request.getAttribute("typeMap")!=null)
      {
       	Object typeObj=request.getAttribute("typeMap");
    	Map typeMap=(Map)typeObj;
    	Set<Map.Entry> typeEntries = typeMap.entrySet();
    	Long sum=new Long(0);
    	for(Map.Entry entry:typeEntries){
    		sum+=(Long)entry.getValue();
    	}
    	String centerLabel="总共"+sum+"个App";
       	%>
<script>
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'doughnut2d',
        renderAt: 'type',
        width: '100%',
        height: '100%',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "应用类型统计图",
                "subCaption": "",
                "numberPrefix": "",
                "paletteColors": "#0075c2,#1aaf5d,#f2c500,#f45b00,#8e0000",
                "bgColor": "#ffffff",
                "showBorder": "0",
                "use3DLighting": "0",
                "showShadow": "1",
                "enableSmartLabels": "1",
                "startingAngle": "310",
                "showLabels": "0",
                "showPercentValues": "1",
                "showLegend": "1",
                "legendShadow": "0",
                "legendBorderAlpha": "0",
                "defaultCenterLabel": "<%=centerLabel%>",
                "centerLabel": "$label: $value",
                "centerLabelBold": "1",
                "showTooltip": "0",
                "decimals": "1",
                "captionFontSize": "14",
                "subcaptionFontSize": "14",
                "subcaptionFontBold": "0"
            },
            "data": [
      	<% for(Map.Entry entry:typeEntries){%>
                {
                    "label": "<%= entry.getKey()%>",
                    "value": <%= entry.getValue()%>
                }, 
                
          <%
          }%>
            ]
        }
    }).render();
});

</script>
    
    <br>
    <div id="date"></div>
   <%}%>
							<!--end-->
						</div>
						<div id="structure" class="section scrollspy">
							<!-- 权限统计 -->  
         <%if(request.getAttribute("permissionMap")!=null)
      {
      	Object permissionObj=request.getAttribute("permissionMap");
    	Map permissionMap=(Map)permissionObj;
    	Set<Map.Entry> permissionEntries = permissionMap.entrySet();

		%>
<script>
FusionCharts.ready(function(){
    var myChart = new FusionCharts({
        type: 'MSColumn2D',
        dataFormat: 'json',
        renderAt: 'permission',
        width: '100%',
        height: '100%',
        dataSource: {
            "chart": {
                "caption": "应用权限统计图",
                "subCaption": "",
                "showBorder": "0",
                "xAxisName": "权限",
                "yAxisName": "应用数量",
                "numberSuffix": "",
                "baseFontColor" : "#333333",
                "baseFont" : "Helvetica Neue,Arial",
                "paletteColors" : "#69f0ae",
                "bgColor" : "#ffffff",
                "canvasBgColor" : "#ffffff",                                 
                "captionFontSize" : "14",
                "subcaptionFontSize" : "14",
                "subcaptionFontBold" : "0",
                "showBorder" : "0",
                "showPlotBorder": "0",
                "showXAxisLine" : "1",
                "showLegend": "0",
                "showShadow" : "1",
                "showCanvasBorder" : "0",
                "showAlternateHGridColor" : "0",
                "usePlotGradientColor" :"0",
                "divlineColor" : "#999999",
                "divlineThickness" : "1",
                "divLineIsDashed" : "1",
                "divLineDashLen" : "1",
                "divLineGapLen" : "1",
                "xAxisLineThickness" : "1",
                "xAxisLineColor" : "#999999",
                "toolTipColor": "#ffffff",
                "toolTipBorderThickness": "0",
                "toolTipBgColor": "#000000",
                "toolTipBgAlpha": "80",
                "toolTipBorderRadius": "2",
                "toolTipPadding": "5"
            },
      
                "categories": [
                {
                  "category": [
                    <%for(Map.Entry entry:permissionEntries)
                  	  {
	      				  String label=null; 
	                	  if(entry.getKey().toString().compareTo("access_coarse_location")==0){label="获取大致位置信息";}
	                      else if(entry.getKey().toString().compareTo("access_fine_location")==0){label="获取精确位置信息";}
	                      else if(entry.getKey().toString().compareTo("internet")==0){label="网络访问";}
	                      else if(entry.getKey().toString().compareTo("camera")==0){label="拍摄照片或视频";}
	                      else if(entry.getKey().toString().compareTo("record_audio")==0){label="录音";}
	                      else if(entry.getKey().toString().compareTo("read_contacts")==0){label="访问联系人";}
	                      else if(entry.getKey().toString().compareTo("write_contacts")==0){label="编辑联系人";}
	                      else if(entry.getKey().toString().compareTo("bluetooth")==0){label="蓝牙";}
	                      else if(entry.getKey().toString().compareTo("nfc")==0){label="NFC";}
	                      else if(entry.getKey().toString().compareTo("calla_phone")==0){label="拨打电话";}
	                      else if(entry.getKey().toString().compareTo("read_sms")==0){label="访问短信";}
	                      else if(entry.getKey().toString().compareTo("write_sms")==0){label="编辑短信";}
	                      else if(entry.getKey().toString().compareTo("modify_audio_settings")==0){label="更改音频设置";}
	                      else if(entry.getKey().toString().compareTo("body_sensors")==0){label="人体传感器";}
	                      else if(entry.getKey().toString().compareTo("read_external_storage")==0){label="读取外部存储设备中的内容";}
	                      else if(entry.getKey().toString().compareTo("write_external_storage")==0){label="更改或删除外部存储设备中的内容";}
	                      else if(entry.getKey().toString().compareTo("read_phone_state")==0){label="读取手机状态";}
	                      else if(entry.getKey().toString().compareTo("modify_phone_state")==0){label="修改手机状态";}
	                      else if(entry.getKey().toString().compareTo("change_wifi_state")==0){label="连接WLAN网络和断开连接";}
	                      else if(entry.getKey().toString().compareTo("access_wifi_state")==0){label="查看WLAN连接";}
	                      else if(entry.getKey().toString().compareTo("flashlight")==0){label="控制闪光灯";}
	                      else if(entry.getKey().toString().compareTo("viberate")==0){label="控制振动";}
	                      else if(entry.getKey().toString().compareTo("system_alert_window")==0){label="在其他应用之上显示内容";}
	                      else if(entry.getKey().toString().compareTo("receive_boot_completed")==0){label="开机启动";}
	                      else if(entry.getKey().toString().compareTo("access_network_state")==0){label="查看网络状态";}
	                      else if(entry.getKey().toString().compareTo("change_network_state")==0){label="更改网络状态";}
	                      else if(entry.getKey().toString().compareTo("read_call_log")==0){label="读取通话记录";}
	                      else if(entry.getKey().toString().compareTo("write_call_log")==0){label="写入通话记录";}
	                      else if(entry.getKey().toString().compareTo("batterty_stats")==0){label="读取电池使用统计信息";}
	                      else if(entry.getKey().toString().compareTo("write_settings")==0){label="修改系统设置";}
	                      else if(entry.getKey().toString().compareTo("expand_status_bar")==0){label="展开/收拢状态栏";}
	                      else if(entry.getKey().toString().compareTo("set_wallpaper")==0){label="设置壁纸";}
	                      else if(entry.getKey().toString().compareTo("set_preferred_applications")==0){label="设置首选应用";}
	                      else if(entry.getKey().toString().compareTo("write_secure_settings")==0){label="修改安全系统设置";}
	                      else{label="error";}%>
                        { "label": "<%=label%>" },
                        <%}%>
                    ]
                }
            ],
            "dataset": [
                {
                    "seriesname": "Loading Time",
                    "allowDrag": "0",
                   "data": [
                		 <%for(Map.Entry entry:permissionEntries){%>
                        { "value": "<%= entry.getValue()%>" },
                        <%}%>
                    ]
                }
            ]
        }
    }).render();
});
</script>
    
    <br>
    <div id="size"></div>
   <%}%>
   
   

						</div>
						<div id="initialization" class="section scrollspy">
							<!-- 上传时间统计 -->
   
    
      <%if(request.getAttribute("uploadDateMap")!=null){
      	Object uploadDateMapObj=request.getAttribute("uploadDateMap");
    	Map uploadDateMap=(Map)uploadDateMapObj;
    	Set<Map.Entry> uploadDateEntries = uploadDateMap.entrySet();%>
<script>
FusionCharts.ready(function(){
    var salesChart = new FusionCharts({
        type: 'scrollline2d',
        dataFormat: 'json',
        renderAt: 'date',
        width: '100%',
        height: '100%',
        dataSource: {
            "chart": {
                "caption": "上传时间统计图",
                "subCaption": "",
                "xAxisName": "月份",
                "yAxisName": "上传数量",
                "showValues": "0",
                "numberPrefix": "",
                "showBorder": "0",
                "showShadow": "1",
                "bgColor": "#ffffff",
                "paletteColors": "#69f0ae",
                "showCanvasBorder": "0",
                "showAxisLines": "0",
                "showAlternateHGridColor": "0",
                "divlineAlpha": "100",
                "divlineThickness": "1",
                "divLineIsDashed": "1",
                "divLineDashLen": "1",
                "divLineGapLen": "1",
                "lineThickness": "3",  
                "flatScrollBars": "1",
                "scrollheight": "10",
                "numVisiblePlot": "12",
                "showHoverEffect":"1"
            },
            //-----------------------------------------
            
            "categories": [
                {
                    "category": [
                    <%for(Map.Entry entry:uploadDateEntries){%>
                        { "label": "<%= entry.getKey()%>" },
                        <%}%>
                       
                    ]
                }
            ],
            "dataset": [
                {
                    "data": [
                       <%for(Map.Entry entry:uploadDateEntries){%>
                        { "value": "<%= entry.getValue()%>" },
                        <%}%>
                       
                    ]
                }
            ]
            
            //-------------------------------------------------------
        }
    }).render();
});
</script>
    
    <br>
    <div id="type">FusionCharts XT will load here!</div>
   <%}%>
   
   
						</div>
						<div id="initialization2" class="section scrollspy">
							 <!-- 文件大小统计 -->
        <%if(request.getAttribute("fileSizeMap")!=null)
      {
      	Object fileSizeMapObj=request.getAttribute("fileSizeMap");
    	Map fileSizeMap=(Map)fileSizeMapObj;
    	Set<Map.Entry> fileSizeEntries = fileSizeMap.entrySet();%>
<script>
FusionCharts.ready(function(){
    var myChart = new FusionCharts({
        type: 'MSColumn2D',
        dataFormat: 'json',
        renderAt: 'size',
        width: '100%',
        height: '100%',
        dataSource: {
            "chart": {
                "caption": "文件大小统计图",
                "subCaption": "",
                "showBorder": "0",
                "xAxisName": "文件大小（MB）",
                "yAxisName": "文件数量",
                "numberSuffix": "",
                "baseFontColor" : "#333333",
                "baseFont" : "Helvetica Neue,Arial",
                "paletteColors" : "#69f0ae",
                "bgColor" : "#ffffff",
                "canvasBgColor" : "#ffffff",                                 
                "captionFontSize" : "14",
                "subcaptionFontSize" : "14",
                "subcaptionFontBold" : "0",
                "showBorder" : "0",
                "showPlotBorder": "0",
                "showXAxisLine" : "1",
                "showLegend": "0",
                "showShadow" : "1",
                "showCanvasBorder" : "0",
                "showAlternateHGridColor" : "0",
                "usePlotGradientColor" :"0",
                "divlineColor" : "#999999",
                "divlineThickness" : "1",
                "divLineIsDashed" : "1",
                "divLineDashLen" : "1",
                "divLineGapLen" : "1",
                "xAxisLineThickness" : "1",
                "xAxisLineColor" : "#999999",
                "toolTipColor": "#ffffff",
                "toolTipBorderThickness": "0",
                "toolTipBgColor": "#000000",
                "toolTipBgAlpha": "80",
                "toolTipBorderRadius": "2",
                "toolTipPadding": "5"
            },
            
            
            "categories": [
                {
                  "category": [
                    <%for(Map.Entry entry:fileSizeEntries){
                    	Integer limit=(Integer)entry.getKey()+10;
                    	String label=entry.getKey()+"-"+limit;%>
                        { "label": "<%=label%>" },
                        <%}%>
                       
                    ]
                }
            ],
            "dataset": [
                {
                    "seriesname": "Loading Time",
                    "allowDrag": "0",
                   "data": [
                       <%for(Map.Entry entry:fileSizeEntries){%>
                        { "value": "<%= entry.getValue()%>" },
                        <%}%>
                       
                    ]
                }
            ]
            
            
        }
    }).render();
});
</script>
    
    <br>
    <div id="permission">FusionCharts XT will load here!</div>
   <%}%>
   

						</div>
					</div>
					<div class="col hide-on-small-only m3 l2">
						<ul class="section table-of-contents side-nav-bar">
							<li>
								<a href="#introduction">时间统计</a>
							</li>
							<li>
								<a href="#structure">大小统计</a>
							</li>
							<li>
								<a href="#initialization">类型统计</a>
							</li>
							<li>
								<a href="#initialization2">权限统计</a>
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