<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'apk_statistics_charts.jsp' starting page</title>
    
	<meta charset="utf-8"> 
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    

    <!-- CORE CSS-->    
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection">

    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="FusionCharts/js/fusioncharts.js"></script>
<script type="text/javascript" src="FusionCharts/js/themes/fusioncharts.theme.fint.js"></script>

  </head>
  
  <body>
  
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
        width: '450',
        height: '450',
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    
    <br>
    <div id="type"></div>
   <%}%>
   
   
   
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
        width: '500',
        height: '300',
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    
    <br>
    <div id="permission"></div>
   <%}%>
   
   
   
   
   
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
        width: '550',
        height: '350',
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    
    <br>
    <div id="date">FusionCharts XT will load here!</div>
   <%}%>
   
   
   
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
        width: '500',
        height: '300',
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    
    <br>
    <div id="size">FusionCharts XT will load here!</div>
   <%}%>
   

    
  </body>
</html>
