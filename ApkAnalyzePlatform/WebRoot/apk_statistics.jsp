<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'apk_statistics.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	 <div>
		<form method="post"  action="/ApkAnalyzePlatform/ApkStatistics">
			
		</form>	 
  	 </div>
  
	  <div>
	    <form method="post" action="/ApkAnalyzePlatform/ApkStatistics">
	    		<br><br>上传时间统计<br /><br /> 
			统计区间：<input type="month" name="startMonth">~<input type="month" name="endMonth">
			
			<br><br>文件大小统计<br /><br /> 
			统计区间：<input type="number" name="minSize" min="0" max="500" step="10">MB~<input type="number" name="maxSize" min="0" max="500" step="10">MB
			
	    	<br /><br /> 
	    	选择需要统计的Apk类型<br /><br /> 
			<label><input name="ApkTypes" type="checkbox" value="系统工具" />系统工具</label> 
			<label><input name="ApkTypes" type="checkbox" value="桌面插件" />桌面插件</label> 
			<label><input name="ApkTypes" type="checkbox" value="资讯阅读" />资讯阅读</label> 
			<label><input name="ApkTypes" type="checkbox" value="社交聊天" />社交聊天</label>
			<label><input name="ApkTypes" type="checkbox" value="影音娱乐" />影音娱乐</label>
			<label><input name="ApkTypes" type="checkbox" value="生活服务" />生活服务</label>
			<label><input name="ApkTypes" type="checkbox" value="实用工具" />实用工具</label>
			<label><input name="ApkTypes" type="checkbox" value="文档商务" />文档商务</label>
			<label><input name="ApkTypes" type="checkbox" value="金融财经" />金融财经</label>
			<label><input name="ApkTypes" type="checkbox" value="运动健康" />运动健康</label>
			<label><input name="ApkTypes" type="checkbox" value="学习教育" />学习教育</label>
			<label><input name="ApkTypes" type="checkbox" value="出行交通" />出行交通</label>
			<label><input name="ApkTypes" type="checkbox" value="其它" />其它</label>
			
			<br><br>
			
			选择需要统计的权限信息<br /><br /> 
			<label><input name="Permissions" type="checkbox" value="access_coarse_location" />获取大致位置信息</label> 
			<label><input name="Permissions" type="checkbox" value="access_fine_location" />获取精确位置信息</label> 
			<label><input name="Permissions" type="checkbox" value="internet" />网络访问</label> 
			<label><input name="Permissions" type="checkbox" value="camera" />拍摄照片或视频</label>
			<label><input name="Permissions" type="checkbox" value="record_audio" />录音</label> 
			<label><input name="Permissions" type="checkbox" value="read_contacts" />访问联系人</label> 
			<label><input name="Permissions" type="checkbox" value="write_contacts" />编辑联系人</label> 
			<label><input name="Permissions" type="checkbox" value="bluetooth" />蓝牙</label> 
			<label><input name="Permissions" type="checkbox" value="nfc" />NFC</label> 
			<label><input name="Permissions" type="checkbox" value="calla_phone" />拨打电话</label> 
			<label><input name="Permissions" type="checkbox" value="read_sms" />访问短信</label> 
			<label><input name="Permissions" type="checkbox" value="write_sms" />编辑短信</label> 
			<label><input name="Permissions" type="checkbox" value="modify_audio_settings" />更改音频设置</label> 
			<label><input name="Permissions" type="checkbox" value="body_sensors" />人体传感器</label> 
			<label><input name="Permissions" type="checkbox" value="read_external_storage" />读取外部存储设备中的内容</label> 
			<label><input name="Permissions" type="checkbox" value="write_external_storage" />更改或删除外部存储设备中的内容</label> 
			<label><input name="Permissions" type="checkbox" value="read_phone_state" />读取手机状态</label> 
			<label><input name="Permissions" type="checkbox" value="modify_phone_state" />修改手机状态</label> 
			<label><input name="Permissions" type="checkbox" value="change_wifi_state" />连接WLAN网络和断开连接</label> 
			<label><input name="Permissions" type="checkbox" value="access_wifi_state" />查看WLAN连接</label> 
			<label><input name="Permissions" type="checkbox" value="flashlight" />控制闪光灯</label> 
			<label><input name="Permissions" type="checkbox" value="viberate" />控制振动</label> 
			<label><input name="Permissions" type="checkbox" value="system_alert_window" />在其他应用之上显示内容</label> 
			<label><input name="Permissions" type="checkbox" value="receive_boot_completed" />开机启动</label>  
			<label><input name="Permissions" type="checkbox" value="access_network_state" />查看网络状态</label>  
			<label><input name="Permissions" type="checkbox" value="change_network_state" />更改网络状态</label>  
			<label><input name="Permissions" type="checkbox" value="read_call_log" />读取通话记录</label>  
			<label><input name="Permissions" type="checkbox" value="write_call_log" />写入通话记录</label>  
			<label><input name="Permissions" type="checkbox" value="batterty_stats" />读取电池使用统计信息</label>  
			<label><input name="Permissions" type="checkbox" value="write_settings" />修改系统设置</label>  
			<label><input name="Permissions" type="checkbox" value="expand_status_bar" />展开/收拢状态栏</label>  
			<label><input name="Permissions" type="checkbox" value="set_wallpaper" />设置壁纸</label>  
			<label><input name="Permissions" type="checkbox" value="set_preferred_applications" />设置首选应用</label>  
			<label><input name="Permissions" type="checkbox" value="write_secure_settings" />修改安全系统设置</label> 

		
			<input type="submit" value="确定">      <input type="reset" value="清空">
	    </form>
	   </div>
	   
	  
   	 </div>
  </body>
</html>
