<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.analysis.cfg.HibernateSessionFactory" %>
<%@ page import = "org.hibernate.Query" %>
<%@ page import = "org.hibernate.Session"%>
<%@ page import = "org.hibernate.Transaction" %>
<%@ page import = "com.analysis.hibernate.*" %>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>user_manager</title>
    
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
    <%
        Session session2 = HibernateSessionFactory.getSession();
        Transaction tx2 = session2.beginTransaction();
        String hql = "from User";
        Query q = session2.createQuery(hql);
        List<User> list = q.list();
        %>
        <form action = "/ApkAnalyzePlatform/usermanagerpattern" method = "post">
        <% 
        for(int i = 0;i < list.size();i ++)
        {
            %>
            <tr>
                <td><input name = "delete" type = "checkbox" value = "<%=list.get(i).getUserId()%>"/></td>
                <td><%=list.get(i).getUserId()%></td>
                <td><%=list.get(i).getUsername()%></td>
                <%if(list.get(i).getDownload() == true){ %>
                <td><input name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "download" checked/> Download</td>
                <%}else{ %>
                <td><input name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "download"/> Download</td>
                <%}
                if(list.get(i).getUpload() == true){ 
                %>
                <td><input name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "upload"checked/> Upload</td>
                <%} else {%>
                <td><input name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "upload"/> Upload</td>
                <%}
                if(list.get(i).getIsAdmin() == true){ 
                %>
                <td><input name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "is_admin" checked/> IsAdmin</td>
                <%}
                else { %>
                <td><input name = "<%=list.get(i).getUserId()%>" type = "checkbox" value = "is_admin"/> IsAdmin </td>
                <%} %>
                <%String temp_name="filesize"+Integer.toString(list.get(i).getUserId() ); %>
                <td> file_size &nbsp;<%=list.get(i).getFileSize()%> 重设<input name = <%=temp_name %> type = "text"/></td>
                <%System.out.println("filesize" + Integer.toString(list.get(i).getUserId() )); %>
            </tr><br>
         <%
         }
         %>
                              
                              
         <input name = "Submit" type = "submit" value = "modify"/>
         <input name = "Submit" type = "submit" value = "delete"/>
         <input name = "reset" type = "reset"/>
         </form>
         
</body>
</html>