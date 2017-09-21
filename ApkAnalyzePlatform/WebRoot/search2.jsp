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
        <form action  = "/ApkAnalyzePlatform/searchpattern" method = "post">
        名称 <input name = "apkName" type = "text" ><br>
        类型<select name = "apkType">
											<option value="" disabled selected>选择类型</option>
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
        <input name = "submit" type = "submit">
        </form>
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
  <!--<%
        List<Apk> res = (List<Apk>) request.getAttribute("res");
        if(res != null) {
            session.setAttribute("res", res);
        }
     %>-->
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
    </body>
    
</html>
